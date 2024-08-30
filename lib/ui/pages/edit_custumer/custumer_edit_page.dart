import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import '../../mixins/mixins.dart';
import '../pages.dart';
import 'components/components.dart';

class CustumerEditPage extends StatefulWidget {
  final CustumerEditPresenter presenter;
  const CustumerEditPage(this.presenter, {super.key});

  @override
  State<CustumerEditPage> createState() => _CustumerEditPageState();
}

class _CustumerEditPageState extends State<CustumerEditPage> with LoadingManager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
        title: Text(
          FlutterI18n.translate(context, 'edit-custumer.title'), style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          handleLoading(context, widget.presenter.isLoadingStream);
          widget.presenter.find();

          return StreamBuilder<CustumerViewModel?>(
            stream: widget.presenter.custumerStream,
            builder: (context, snapshot) {
              if (snapshot.hasData || snapshot.data != null) {
                return ListenableProvider(
                  create: (_) => widget.presenter,
                  child: SingleChildScrollView(child: EditCustumerInputs(snapshot.data!, widget.presenter))
                );
              }
              return const SizedBox(height: 0);
            },
          );
        },  
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => widget.presenter.edit(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.teal,
        child: const Icon(Icons.check, color: Colors.white, size: 25),
      ),
    );
  }
}