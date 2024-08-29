import '../../../presentation/presenters/presenters.dart';
import '../../../ui/pages/pages.dart';
import '../../factories.dart';

ProductsPresenter makeGetxProductsPresenter() => GextProductsPresenter(
  loadProducts: makeLoadProducts(),
  deleteProduct: makeDeleteProduct()
);