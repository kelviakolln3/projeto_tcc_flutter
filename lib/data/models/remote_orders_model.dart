import '../../domain/domain.dart';
import '../http/http.dart';

class RemoteOrdersModel {
  final int idPedido;
  final int idCliente;
  final int idUsuario;
  final String dataCriacao;
  final String condicaoPagamento;
  final String formaPagamento;
  final double total;
  final List<RemoteOrderItemModel> itemPedidoBeans;

  const RemoteOrdersModel({
    required this.idPedido,
    required this.idCliente,
    required this.idUsuario,
    required this.dataCriacao,
    required this.condicaoPagamento,
    required this.formaPagamento,
    required this.total,
    required this.itemPedidoBeans,
  });

  factory RemoteOrdersModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['idPedido', 'idCliente', 'idUsuario', 'dataCriacao', 'condicaoPagamento', 'formaPagamento', 'total', 'itemPedidoBeans'])) {
      throw HttpError.invalidData;
    }
    return RemoteOrdersModel(
      idPedido: json['idPedido'],
      idCliente: json['idCliente'],
      idUsuario: json['idUsuario'],
      dataCriacao: json["dataCriacao"],
      condicaoPagamento: json['condicaoPagamento'],
      formaPagamento: json['formaPagamento'],
      total: json['total'],
      itemPedidoBeans: (json['itemPedidoBeans'] as List).map((item) => RemoteOrderItemModel.fromJson(item)).toList(),
    );
  }

  OrderEntity toEntity() => OrderEntity(
    idPedido: idPedido,
    idCliente: idCliente,
    idUsuario: idUsuario,
    dataCriacao: dataCriacao,
    condicaoPagamento: condicaoPagamento,
    formaPagamento: formaPagamento,
    total: total,
    itemPedidoBeans: itemPedidoBeans.map((item) => item.toEntity()).toList(),
  );
} 

class RemoteOrderItemModel {
  final int idItemPedido;
  final int idProduto;
  final double quantidade;
  final double valorUnitario;

  const RemoteOrderItemModel({
    required this.idItemPedido,
    required this.idProduto,
    required this.quantidade,
    required this.valorUnitario,
  });

  factory RemoteOrderItemModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['idItemPedido', 'idProduto', 'quantidade', 'valorUnitario'])) {
      throw HttpError.invalidData;
    }
    return RemoteOrderItemModel(
      idItemPedido: json['idItemPedido'],
      idProduto: json['idProduto'],
      quantidade: json['quantidade'].toDouble(),
      valorUnitario: json['valorUnitario'].toDouble(),
    );
  }

  ItemPedidoEntity toEntity() => ItemPedidoEntity(
    idItemPedido: idItemPedido,
    idProduto: idProduto,
    quantidade: quantidade,
    valorUnitario: valorUnitario,
  );
}
