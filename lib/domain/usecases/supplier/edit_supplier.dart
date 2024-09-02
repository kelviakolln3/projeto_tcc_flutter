import 'package:equatable/equatable.dart';

import '../../entities/entities.dart';

abstract class EditSupplier {
  Future<SupplierEntity?> edit(EditSupplierParams params);
}

class EditSupplierParams extends Equatable {
  final int idFornecedor;
  final int codigo;
	final String atividade;
	final String empresa;
	final String contato;
	final String endereco;
	final String email;

  @override
  List get props => [codigo, atividade, empresa, contato, endereco, email];

  const EditSupplierParams({
    required this.idFornecedor,
    required this.codigo,
    required this.atividade,
    required this.empresa, 
    required this.contato,
    required this.endereco,
    required this.email
  });
}