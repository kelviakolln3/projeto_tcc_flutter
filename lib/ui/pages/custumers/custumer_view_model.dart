import 'package:equatable/equatable.dart';

class CustumerViewModel extends Equatable {
  final int? idCliente;
  final String nome;
  final String cpf;
  final String rg;
  final String endereco;
  final String dataNasc;
  final String contato;
  final String email;

  @override
  List get props => [idCliente, nome, cpf, rg, endereco, dataNasc, contato, email];

  const CustumerViewModel({
    this.idCliente,
    required this.nome,
    required this.cpf,
    required this.rg,
    required this.endereco,
    required this.dataNasc,
    required this.contato,
    required this.email
  });
}