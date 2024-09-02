import '../../../../domain/domain.dart';
import '../../../http/http.dart';
import '../../../models/models.dart';

class RemoteCreateProduct implements CreateProduct {
  final HttpClient httpClient;
  final String url;

  RemoteCreateProduct({
    required this.httpClient,
    required this.url
  });

  @override
  Future<ProductEntity?> create(CreateProductParams params) async {
    final body = RemoteCreateProductParams.fromDomain(params).toJson();
    try {
      final httpResponse = await httpClient.request(url: url, method: 'post', body: body);
      return RemoteProductsModel.fromJson(httpResponse).toEntity();
    } on HttpError {
      DomainError.unexpected;
    }
    return null;
  }
}

class RemoteCreateProductParams {
  final int codigo;
  final String nome;
  final String codigoBarras;
  final double estoque;
  final String grupo;
  final String marca;
  final double valorVenda;

  RemoteCreateProductParams({
    required this.codigo,
    required this.nome,
    required this.codigoBarras,
    required this.estoque,
    required this.grupo,
    required this.marca,
    required this.valorVenda
  });

  factory RemoteCreateProductParams.fromDomain(CreateProductParams params) => RemoteCreateProductParams(
    codigo: params.codigo,
    nome: params.nome,
    codigoBarras: params.codigoBarras,
    estoque: params.estoque,
    grupo: params.grupo,
    marca: params.marca,
    valorVenda: params.valorVenda
  );

  Map toJson() => {
    'codigo': codigo,
    'nome': nome,
    'codigoBarras': codigoBarras,
    'estoque': estoque,
    'grupo': grupo,
    'marca': marca,
    'valorVenda': valorVenda
  };
}