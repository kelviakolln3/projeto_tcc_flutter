import 'package:equatable/equatable.dart';
import '../../entities/entities.dart';

abstract class EditCustumer {
  Future<CustumerEntity?> edit(EditCustumerParams params);
}

class EditCustumerParams extends Equatable {
  final int idCliente;
  final int codigo;
  final String nome;
  final String cpf;
  final String rg;
  final String endereco;
  final String dataNasc;
  final String contato;
  final String email;

  @override
  List get props => [idCliente, codigo, nome, cpf, rg, endereco, dataNasc, contato, email];

  const EditCustumerParams({
    required this.idCliente,
    required this.codigo,
    required this.nome,
    required this.cpf,
    required this.rg,
    required this.endereco,
    required this.dataNasc,
    required this.contato,
    required this.email,
  });
}