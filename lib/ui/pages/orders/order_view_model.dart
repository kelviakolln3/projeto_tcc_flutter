import 'package:equatable/equatable.dart';

class OrderViewModel extends Equatable {
  final int? idPedido;
  final int idCliente;
  final int idUsuario;
  final String dataCriacao;
  final String condicaoPagamento;
  final String formaPagamento;
  final double total;
  final List<ItemPedidoViewModel> itemPedidoBeans;

  @override
  List get props => [idPedido, idCliente, idUsuario, dataCriacao, condicaoPagamento, formaPagamento, total, itemPedidoBeans];

  const OrderViewModel({
    this.idPedido,
    required this.idCliente,
    required this.idUsuario,
    required this.dataCriacao,
    required this.condicaoPagamento,
    required this.formaPagamento,
    required this.total,
    required this.itemPedidoBeans,
  });
} 

class ItemPedidoViewModel extends Equatable {
  final int? idItemPedido;
  final int idProduto;
  final double quantidade;
  final double valorUnitario;

  @override
  List get props => [idItemPedido, idProduto, quantidade, valorUnitario];

  const ItemPedidoViewModel({
    this.idItemPedido,
    required this.idProduto,
    required this.quantidade,
    required this.valorUnitario,
  });
}
