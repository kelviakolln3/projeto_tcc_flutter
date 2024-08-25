import '../../../presentation/presenters/presenters.dart';
import '../../../ui/pages/pages.dart';
import '../../factories.dart';

ProductsPresenter makeGetxProductsPresenter() => GexProductsPresenter(
  loadProducts: makeLoadProducts(),
  deleteProduct: makeDeleteProduct()
);