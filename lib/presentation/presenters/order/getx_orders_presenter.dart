import 'package:get/get.dart';
import '../../../domain/domain.dart';
import '../../../ui/pages/pages.dart';
import '../../mixins/mixins.dart';

class GetxOrdersPresenter extends GetxController with LoadingManager, NavigationManager implements OrdersPresenter{
  final LoadOrders loadOrders;
  final DeleteOrder deleteOrder;
  final DeleteItemOrder deleteItemOrder;

  final _orders = Rx<List<OrderViewModel>>([]);

  @override
  Stream<List<OrderViewModel>> get ordersStream => _orders.stream;

  GetxOrdersPresenter({required this.loadOrders, required this.deleteOrder, required this.deleteItemOrder});

  @override
  Future<void> loadData() async {
    try {
      isLoading = true;
      final orders = await loadOrders.load();
      _orders.value = orders
          .map((order) => OrderViewModel(
              idPedido: order.idPedido,
              idCliente: order.idCliente,
              idUsuario: order.idUsuario,
              dataCriacao: order.dataCriacao,
              condicaoPagamento: order.condicaoPagamento,
              formaPagamento: order.formaPagamento,
              total: order.total,
              itemPedidoBeans: order.itemPedidoBeans.map((item) => ItemPedidoViewModel(
                idItemPedido: item.idItemPedido,
                idProduto: item.idProduto,
                quantidade: item.quantidade,
                valorUnitario: item.valorUnitario,
              )).toList()))
          .toList();
    } on DomainError {
      _orders.subject.addError('Erro inesperado \n tente novamente');
    }finally {
      isLoading = false;
    }
  }

  @override
  Future<void> delete(OrderViewModel order) async {
    try {
      isLoading = true;
      List<OrderViewModel> list = _orders.value.toList();
      for (var item in order.itemPedidoBeans) {
        await deleteItemOrder.delete(item.idItemPedido!);
      }
      final delete = await deleteOrder.delete(order.idPedido!);
      if(delete) {
        list.removeWhere((c) => c.idPedido == order.idPedido!);
        _orders.value = list;
      }
    } on DomainError {
      _orders.subject.addError('Erro inesperado \n tente novamente');
    }finally {
      isLoading = false;
    }
  }
}