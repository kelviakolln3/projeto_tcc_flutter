import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import '../../components/components.dart';
import '../../mixins/mixins.dart';
import 'components/components.dart';
import 'custumers.dart';

class CustumersPage extends StatefulWidget {
  final CustumersPresenter presenter;

  const CustumersPage(this.presenter, {super.key});

  @override
  State<CustumersPage> createState() => _CustumersPageState();
}

class _CustumersPageState extends State<CustumersPage> with LoadingManager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
        title: Text(
          FlutterI18n.translate(context, 'custumers.title'), style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          handleLoading(context, widget.presenter.isLoadingStream);
          widget.presenter.loadData();

          return StreamBuilder<List<CustumerViewModel>>(
            stream: widget.presenter.custumersStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return ReloadScreen(error: '${snapshot.error}', reload: widget.presenter.loadData);
              }
              if (snapshot.hasData) {
                return ListenableProvider(
                  create: (_) => widget.presenter,
                  child: CustumerList(snapshot.data!, widget.presenter)
                );
              }
              return const SizedBox(height: 0);
            }
          );
        },
      ),
    );
  }
}