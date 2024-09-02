import 'package:equatable/equatable.dart';

import '../../entities/entities.dart';

abstract class CreateOrder {
  Future<OrderEntity?> create(CreateOrderParams params); 
}

class CreateOrderParams extends Equatable {
  final int idCliente;
  final int idUsuario;
  final String dataCriacao;
  final String condicaoPagamento;
  final String formaPagamento;
  final double total;
  final List<CreateItemOrderParams> itemPedidoBeans;

  @override
  List get props => [idCliente, idUsuario, dataCriacao, condicaoPagamento, formaPagamento, total, itemPedidoBeans];

  const CreateOrderParams({
    required this.idCliente,
    required this.idUsuario,
    required this.dataCriacao,
    required this.condicaoPagamento,
    required this.formaPagamento,
    required this.total,
    required this.itemPedidoBeans,
  });
}

class CreateItemOrderParams extends Equatable {
  final int idProduto;
  final double quantidade;
  final double valorUnitario;

  @override
  List get props => [idProduto, quantidade, valorUnitario];

  const CreateItemOrderParams({
    required this.idProduto,
    required this.quantidade,
    required this.valorUnitario,
  });
}