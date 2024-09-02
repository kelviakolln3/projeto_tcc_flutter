import 'package:get/get.dart';
import '../../../domain/domain.dart';
import '../../../ui/pages/pages.dart';
import '../../mixins/mixins.dart';

class GetxCustumersPresenter extends GetxController with LoadingManager, NavigationManager implements CustumersPresenter {
  final LoadCustumers loadCustumers;
  final DeleteCustumer deleteCustumer;
  final _custumers = Rx<List<CustumerViewModel>>([]);

  @override
  Stream<List<CustumerViewModel>> get custumersStream => _custumers.stream;

  GetxCustumersPresenter({required this.loadCustumers, required this.deleteCustumer});

  @override
  Future<void> loadData() async {
    try {
      isLoading = true;
      final custumers = await loadCustumers.load();
      _custumers.value = custumers
          .map((custumer) => CustumerViewModel(
              idCliente: custumer.idCliente,
              codigo: custumer.codigo,
              nome: custumer.nome,
              cpf: custumer.cpf,
              rg: custumer.rg,
              endereco: custumer.endereco,
              dataNasc: custumer.dataNasc,
              contato: custumer.contato,
              email: custumer.email))
          .toList();
    } on DomainError {
      _custumers.subject.addError('Erro inesperado \n tente novamente');
    }finally {
      isLoading = false;
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      isLoading = true;
      List<CustumerViewModel> list = _custumers.value.toList();
      final delete = await deleteCustumer.delete(id);
      if(delete) {
        list.removeWhere((c) => c.idCliente == id);
        _custumers.value = list;
      }
    } on DomainError {
      _custumers.subject.addError('Erro inesperado \n tente novamente');
    }finally {
      isLoading = false;
    }
  }
}
