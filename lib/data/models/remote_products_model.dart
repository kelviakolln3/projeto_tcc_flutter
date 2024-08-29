import '../../domain/domain.dart';
import '../http/http.dart';

class RemoteProductsModel {
  final int idProduto;
  final int codigo;
  final String nome;
  final String codigoBarras;
  final double estoque;
  final String grupo;
  final String marca;
  final double valorVenda;

  RemoteProductsModel({
    required this.idProduto,
    required this.codigo,
    required this.nome,
    required this.codigoBarras,
    required this.estoque,
    required this.grupo,
    required this.marca,
    required this.valorVenda
  });

  factory RemoteProductsModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['idProduto', 'codigo', 'nome', 'codigoBarras', 'estoque', 'grupo', 'marca', 'valorVenda'])) {
      throw HttpError.invalidData;
    }
    return RemoteProductsModel(
      idProduto: json['idProduto'],
      codigo: json['codigo'],
      nome: json['nome'],
      codigoBarras: json["codigoBarras"],
      estoque: json['estoque'],
      grupo: json['grupo'],
      marca: json['marca'],
      valorVenda: json['valorVenda'],
    );
  }

  ProductEntity toEntity() => ProductEntity(
    idProduto: idProduto,
    codigo: codigo,
    nome: nome,
    codigoBarras: codigoBarras,
    estoque: estoque,
    grupo: grupo,
    marca: marca,
    valorVenda: valorVenda,
  );
}