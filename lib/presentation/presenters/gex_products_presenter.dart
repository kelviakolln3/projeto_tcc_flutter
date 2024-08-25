import 'package:get/get.dart';
import '../../domain/domain.dart';
import '../../ui/pages/pages.dart';
import '../mixins/mixins.dart';

class GexProductsPresenter extends GetxController with LoadingManager, NavigationManager implements ProductsPresenter{
  final LoadProducts loadProducts;
  final DeleteProduct deleteProduct;

  final _products = Rx<List<ProductsViewModel>>([]);

  @override
  Stream<List<ProductsViewModel>> get productsStream => _products.stream;

  GexProductsPresenter({required this.loadProducts, required this.deleteProduct});

  @override
  Future<void> loadData() async {
    try {
      isLoading = true;
      final products = await loadProducts.load();
      _products.value = products
          .map((product) => ProductsViewModel(
              idProduto: product.idProduto,
              codigo: product.codigo,
              nome: product.nome,
              codigoBarras: product.codigoBarras,
              estoque: product.estoque,
              grupo: product.grupo,
              marca: product.marca,
              valorVenda: product.valorVenda))
          .toList();
    } on DomainError {
      _products.subject.addError('Erro inesperado \n tente novamente');
    }finally {
      isLoading = false;
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      isLoading = true;
      List<ProductsViewModel> list = _products.value.toList();
      final delete = await deleteProduct.delete(id);
      if(delete) {
        list.removeWhere((c) => c.idProduto == id);
        _products.value = list;
      }
    } on DomainError {
      _products.subject.addError('Erro inesperado \n tente novamente');
    }finally {
      isLoading = false;
    }
  }
}