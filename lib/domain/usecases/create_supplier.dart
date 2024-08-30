import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

abstract class CreateSupplier {
  Future<SupplierEntity?> create(CreateSupplierParams params);
}

class CreateSupplierParams extends Equatable {
  final int codigo;
	final String atividade;
	final String empresa;
	final String contato;
	final String endereco;
	final String email;

  @override
  List get props => [codigo, atividade, empresa, contato, endereco, email];

  const CreateSupplierParams({
    required this.codigo,
    required this.atividade,
    required this.empresa, 
    required this.contato,
    required this.endereco,
    required this.email
  });
}