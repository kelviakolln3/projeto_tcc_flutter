import '../../../../domain/domain.dart';
import '../../../data.dart';

class RemoteEditOrder implements EditOrder {
  final HttpClient httpClient;
  final String url;

  RemoteEditOrder({
    required this.httpClient,
    required this.url,
  });

  @override
  Future<OrderEntity> edit(EditOrderParams params) async {
    final body = RemoteEditOrderParams.fromDomain(params).toJson();
    try {
      final httpResponse = await httpClient.request(url: url, method: 'post', body: body);
      return RemoteOrdersModel.fromJson(httpResponse).toEntity();
    } on HttpError {
      throw DomainError.unexpected;
    }
  }
}

class RemoteEditOrderParams {
  final int idPedido;
  final int idCliente;
  final int idUsuario;
  final String dataCriacao;
  final String condicaoPagamento;
  final String formaPagamento;
  final double total;
  final List<RemoteEditOrderItemParams> itemPedidoBeans;

  RemoteEditOrderParams({
    required this.idPedido,
    required this.idCliente,
    required this.idUsuario,
    required this.dataCriacao,
    required this.condicaoPagamento,
    required this.formaPagamento,
    required this.total,
    required this.itemPedidoBeans,
  });

  factory RemoteEditOrderParams.fromDomain(EditOrderParams params) => RemoteEditOrderParams(
    idPedido: params.idPedido,
    idCliente: params.idCliente,
    idUsuario: params.idUsuario,
    dataCriacao: params.dataCriacao,
    condicaoPagamento: params.condicaoPagamento,
    formaPagamento: params.formaPagamento,
    total: params.total,
    itemPedidoBeans: params.itemPedidoBeans.map((item) => RemoteEditOrderItemParams.fromDomain(item)).toList(),
  );

  Map toJson() => {
    'idPedido': idPedido,
    'idCliente': idCliente,
    'idUsuario': idUsuario,
    'dataCriacao': dataCriacao,
    'condicaoPagamento': condicaoPagamento,
    'formaPagamento': formaPagamento,
    'total': total,
    'itemPedidoBeans': itemPedidoBeans.map((item) => item.toJson()).toList(),
  };
}

class RemoteEditOrderItemParams {
  final int? idItemPedido;
  final int idProduto;
  final double quantidade;
  final double valorUnitario;

  RemoteEditOrderItemParams({
    this.idItemPedido,
    required this.idProduto,
    required this.quantidade,
    required this.valorUnitario,
  });

  factory RemoteEditOrderItemParams.fromDomain(EditItemOrderParams params) => RemoteEditOrderItemParams(
    idItemPedido: params.idItemPedido,
    idProduto: params.idProduto,
    quantidade: params.quantidade,
    valorUnitario: params.valorUnitario,
  );

  Map toJson() => {
    if(idItemPedido != null) 'idItemPedido': idItemPedido,
    'idProduto': idProduto,
    'quantidade': quantidade,
    'valorUnitario': valorUnitario,
  };
}
