import '../../../presentation/presentation.dart';
import '../../../ui/ui.dart';
import '../../factories.dart';

SupplierEditPresenter makeGetxSupplierEditPresenter(String idFornecedor) => GetxSupplierEditPresenter(
  findSupplier: makeFindSupplier(),
  editSupplier: makeEditSupplier(),
  idFornecedor: idFornecedor
);