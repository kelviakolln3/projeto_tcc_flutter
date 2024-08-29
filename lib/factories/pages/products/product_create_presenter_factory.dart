import '../../../presentation/presenters/presenters.dart';
import '../../../ui/pages/pages.dart';
import '../../factories.dart';

ProductCreatePresenter makeGetxProductCreatePresenter() => GetxProductCreatePresenter(
  createProduct: makeCreateProduct()
);