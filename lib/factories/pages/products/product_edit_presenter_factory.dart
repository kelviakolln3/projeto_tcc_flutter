import '../../../presentation/presentation.dart';
import '../../../ui/ui.dart';
import '../../factories.dart';

ProductEditPresenter makeGetxProductEditPresenter(String idProduto) => GetxProductEditPresenter(
  findProduct: makeFindProduct(),
  editProduct: makeEditProduct(),
  idProduto: idProduto
);