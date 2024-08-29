import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

abstract class CreateProduct {
  Future<ProductEntity?> create(CreateProductParams params);
}

class CreateProductParams extends Equatable {
  final int codigo;
  final String nome;
  final String codigoBarras;
  final double estoque;
  final String grupo;
  final String marca;
  final double valorVenda;

  @override
  List get props => [codigo, nome, codigoBarras, estoque, grupo, marca, valorVenda];

  const CreateProductParams({
    required this.codigo,
    required this.nome,
    required this.codigoBarras,
    required this.estoque,
    required this.grupo,
    required this.marca,
    required this.valorVenda
  });
}