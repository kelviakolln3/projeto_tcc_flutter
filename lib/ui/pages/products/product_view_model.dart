import 'package:equatable/equatable.dart';

class ProductViewModel extends Equatable {
  final int? idProduto;
  final int codigo;
  final String nome;
  final String codigoBarras;
  final double estoque;
  final String grupo;
  final String marca;
  final double valorVenda;

  @override
  List get props => [idProduto, codigo, nome, codigoBarras, estoque, grupo, marca, valorVenda];

  const ProductViewModel({
    this.idProduto,
    required this.codigo,
    required this.nome,
    required this.codigoBarras,
    required this.estoque,
    required this.grupo,
    required this.marca,
    required this.valorVenda
  });
}