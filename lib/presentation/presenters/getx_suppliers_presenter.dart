import 'package:get/get.dart';
import '../../domain/domain.dart';
import '../../ui/pages/pages.dart';
import '../mixins/mixins.dart';

class GetxSuppliersPresenter extends GetxController with LoadingManager, NavigationManager implements SuppliersPresenter{
  final LoadSuppliers loadSuppliers;
  final DeleteSupplier deleteSupplier;

  final _suppliers = Rx<List<SupplierViewModel>>([]);

  @override
  Stream<List<SupplierViewModel>> get suppliersStream => _suppliers.stream;

  GetxSuppliersPresenter({required this.loadSuppliers, required this.deleteSupplier});

  @override
  Future<void> loadData() async {
    try {
      isLoading = true;
      final suppliers = await loadSuppliers.load();
      _suppliers.value = suppliers
          .map((supplier) => SupplierViewModel(
              idFornecedor: supplier.idFornecedor,
              codigo: supplier.codigo,
              atividade: supplier.atividade,
              empresa: supplier.empresa,
              contato: supplier.contato,
              endereco: supplier.endereco,
              email: supplier.email))
          .toList();
    } on DomainError {
      _suppliers.subject.addError('Erro inesperado \n tente novamente');
    }finally {
      isLoading = false;
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      isLoading = true;
      List<SupplierViewModel> list = _suppliers.value.toList();
      final delete = await deleteSupplier.delete(id);
      if(delete) {
        list.removeWhere((c) => c.idFornecedor == id);
        _suppliers.value = list;
      }
    } on DomainError {
      _suppliers.subject.addError('Erro inesperado \n tente novamente');
    }finally {
      isLoading = false;
    }
  }
}