import '../../../presentation/presentation.dart';
import '../../../ui/pages/pages.dart';
import '../../factories.dart';

SuppliersPresenter makeGetxSuppliersPresenter() => GetxSuppliersPresenter(
  loadSuppliers: makeLoadSuppliers(),
  deleteSupplier: makeDeleteSupplier()
);