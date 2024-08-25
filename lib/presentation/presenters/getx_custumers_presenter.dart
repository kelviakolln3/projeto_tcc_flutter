import 'package:get/get.dart';
import '../../domain/domain.dart';
import '../../ui/pages/pages.dart';
import '../mixins/mixins.dart';

class GetxCustumersPresenter extends GetxController with LoadingManager, NavigationManager implements CustumersPresenter {
  final LoadCustumers loadCustumers;
  final _custumers = Rx<List<CustumerViewModel>>([]);

  @override
  Stream<List<CustumerViewModel>> get custumersStream => _custumers.stream;

  GetxCustumersPresenter({required this.loadCustumers});

  @override
  Future<void> loadData() async {
    try {
      isLoading = true;
      final custumers = await loadCustumers.load();
      _custumers.value = custumers
          .map((custumer) => CustumerViewModel(
              idCliente: custumer.idCliente,
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
}
