import '../../../presentation/presentation.dart';
import '../../../ui/ui.dart';
import '../../factories.dart';

CustumerEditPresenter makeGetxCustumerEditPresenter(String idCliente) => GetxCustumerEditPresenter(
  findCustumer: makeFindCustumer(),
  editCustumer: makeEditCustumer(),
  idCliente: idCliente
);