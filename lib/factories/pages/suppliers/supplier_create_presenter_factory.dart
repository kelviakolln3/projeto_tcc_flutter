import '../../../presentation/presentation.dart';
import '../../../ui/pages/pages.dart';
import '../../factories.dart';

SupplierCreatePresenter makeGetxSupplierCreatePresenter() => GetxSupplierCreatePresenter(
  createSupplier: makeCreateSupplier()
);