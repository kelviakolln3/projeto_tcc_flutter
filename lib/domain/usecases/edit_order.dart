import 'package:equatable/equatable.dart';

import '../domain.dart';

abstract class EditOrder {
  Future<OrderEntity?> edit(EditOrderParams params);
}

class EditOrderParams extends Equatable {
  final int idPedido;
  final int idCliente;
  final int idUsuario;
  final String dataCriacao;
  final String condicaoPagamento;
  final String formaPagamento;
  final double total;
  final List<EditItemOrderParams> itemPedidoBeans;

  @override
  List get props => [idPedido, idCliente, idUsuario, dataCriacao, condicaoPagamento, formaPagamento, total, itemPedidoBeans];

  const EditOrderParams({
    required this.idPedido,
    required this.idCliente,
    required this.idUsuario,
    required this.dataCriacao,
    required this.condicaoPagamento,
    required this.formaPagamento,
    required this.total,
    required this.itemPedidoBeans,
  });
}

class EditItemOrderParams extends Equatable {
  final int idItemPedido;
  final int idProduto;
  final double quantidade;
  final double valorUnitario;

  @override
  List get props => [idItemPedido, idProduto, quantidade, valorUnitario];

  const EditItemOrderParams({
    required this.idItemPedido,
    required this.idProduto,
    required this.quantidade,
    required this.valorUnitario,
  });
}