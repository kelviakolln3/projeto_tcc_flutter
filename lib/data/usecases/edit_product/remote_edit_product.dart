import '../../../domain/domain.dart';
import '../../data.dart';

class RemoteEditProduct implements EditProduct {
  final HttpClient httpClient;
  final String url;

  RemoteEditProduct({
    required this.httpClient,
    required this.url
  });

  @override
  Future<ProductEntity?> edit(EditProductParams params) async {
    final body = RemoteEditProductParams.fromDomain(params).toJson();
    try {
      final httpResponse = await httpClient.request(url: '$url/${params.idProduto}', method: 'put', body: body);
      return RemoteProductsModel.fromJson(httpResponse).toEntity();
    } on HttpError {
      DomainError.unexpected;
    }
    return null;
  }
}

class RemoteEditProductParams {
  final int idProduto;
  final int codigo;
  final String nome;
  final String codigoBarras;
  final double estoque;
  final String grupo;
  final String marca;
  final double valorVenda;

  RemoteEditProductParams({
    required this.idProduto,
    required this.codigo,
    required this.nome,
    required this.codigoBarras,
    required this.estoque,
    required this.grupo,
    required this.marca,
    required this.valorVenda
  });

  factory RemoteEditProductParams.fromDomain(EditProductParams params) => RemoteEditProductParams(
    idProduto: params.idProduto, 
    codigo: params.codigo, 
    nome: params.nome, 
    codigoBarras: params.codigoBarras, 
    estoque: params.estoque, 
    grupo: params.grupo, 
    marca: params.marca, 
    valorVenda: params.valorVenda
  );

  Map toJson() => {
    'idProduto': idProduto,
    'codigo': codigo,
    'nome': nome,
    'codigoBarras': codigoBarras,
    'estoque': estoque,
    'grupo': grupo,
    'marca': marca,
    'valorVenda': valorVenda
  };
}
