import '../../../../domain/domain.dart';
import '../../../http/http.dart';
import '../../../models/models.dart';

class RemoteCreateOrder implements CreateOrder {
  final HttpClient httpClient;
  final String url;

  RemoteCreateOrder({
    required this.httpClient,
    required this.url
  });

  @override
  Future<OrderEntity?> create(CreateOrderParams params) async {
    final body = RemoteCreateOrderParams.fromDomain(params).toJson();
    try {
      final httpResponse = await httpClient.request(url: url, method: 'post', body: body);
      return RemoteOrdersModel.fromJson(httpResponse).toEntity();
    } on HttpError {
      DomainError.unexpected;
    }
    return null;
  }
}

class RemoteCreateOrderParams {
  final int idCliente;
  final int idUsuario;
  final String dataCriacao;
  final String condicaoPagamento;
  final String formaPagamento;
  final double total;
  final List<RemoteCreateItemOrderParams> itemPedidoBeans;

  const RemoteCreateOrderParams({
    required this.idCliente,
    required this.idUsuario,
    required this.dataCriacao,
    required this.condicaoPagamento,
    required this.formaPagamento,
    required this.total,
    required this.itemPedidoBeans,
  });

  factory RemoteCreateOrderParams.fromDomain(CreateOrderParams params) => RemoteCreateOrderParams(
    idCliente: params.idCliente,
    idUsuario: params.idUsuario,
    dataCriacao: params.dataCriacao,
    condicaoPagamento: params.condicaoPagamento,
    formaPagamento: params.formaPagamento,
    total: params.total,
    itemPedidoBeans: params.itemPedidoBeans.map((item) => RemoteCreateItemOrderParams.fromDomain(item)).toList(),
  );

  Map toJson() => {
    'idCliente': idCliente,
    'idUsuario': idUsuario,
    'dataCriacao': dataCriacao,
    'condicaoPagamento': condicaoPagamento,
    'formaPagamento': formaPagamento,
    'total': total,
    'itemPedidoBeans': itemPedidoBeans.map((item) => item.toJson()).toList(),
  };
}

class RemoteCreateItemOrderParams {
  final int idProduto;
  final double quantidade;
  final double valorUnitario;

  const RemoteCreateItemOrderParams({
    required this.idProduto,
    required this.quantidade,
    required this.valorUnitario,
  });

  factory RemoteCreateItemOrderParams.fromDomain(CreateItemOrderParams params) => RemoteCreateItemOrderParams(
    idProduto: params.idProduto,
    quantidade: params.quantidade,
    valorUnitario: params.valorUnitario,
  );

  Map toJson() => {
    'idProduto': idProduto,
    'quantidade': quantidade,
    'valorUnitario': valorUnitario,
  };
}