import 'package:equatable/equatable.dart';

class SupplierEntity extends Equatable {
  final int? idFornecedor;
  final int codigo;
  final String atividade;
  final String empresa;
  final String contato;
  final String endereco;
  final String email;

  @override
  List get props => [idFornecedor, codigo, atividade, empresa, contato, endereco, email];

  const SupplierEntity({
    this.idFornecedor,
    required this.codigo,
    required this.atividade,
    required this.empresa,
    required this.contato,
    required this.endereco,
    required this.email
  });
}