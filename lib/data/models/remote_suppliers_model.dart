import '../../domain/domain.dart';
import '../http/http.dart';

class RemoteSuppliersModel {
  final int idFornecedor;
  final int codigo;
  final String atividade;
  final String empresa;
  final String contato;
  final String endereco;
  final String email;

  const RemoteSuppliersModel({
    required this.idFornecedor,
    required this.codigo,
    required this.atividade,
    required this.empresa,
    required this.contato,
    required this.endereco,
    required this.email
  });

  factory RemoteSuppliersModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['idFornecedor', 'codigo', 'atividade', 'empresa', 'contato', 'endereco', 'email'])) {
      throw HttpError.invalidData;
    }
    return RemoteSuppliersModel(
      idFornecedor: json['idFornecedor'],
      codigo: json['codigo'],
      atividade: json['atividade'],
      empresa: json["empresa"],
      contato: json['contato'],
      endereco: json['endereco'],
      email: json['email'],
    );
  }

  SupplierEntity toEntity() => SupplierEntity(
    idFornecedor: idFornecedor,
    codigo: codigo,
    atividade: atividade,
    empresa: empresa,
    contato: contato,
    endereco: endereco,
    email: email,
  );
}