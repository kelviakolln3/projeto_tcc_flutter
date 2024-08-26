import '../../domain/entities/entities.dart';
import '../http/http.dart';

class RemoteCustumersModel {
  final int idCliente;
  final int codigo;
  final String nome;
  final String cpf;
  final String rg;
  final String endereco;
  final String dataNasc;
  final String contato;
  final String email;

  RemoteCustumersModel({
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

  factory RemoteCustumersModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['idCliente', 'codigo', 'nome', 'cpf', 'rg', 'endereco', 'dataNasc', 'contato', 'email'])) {
      throw HttpError.invalidData;
    }
    return RemoteCustumersModel(
      idCliente: json['idCliente'],
      codigo: json['codigo'],
      nome: json['nome'],
      cpf: json['cpf'],
      rg: json["rg"],
      endereco: json['endereco'],
      dataNasc: json['dataNasc'],
      contato: json['contato'],
      email: json['email'],
    );
  }

  CustumerEntity toEntity() => CustumerEntity(
    idCliente: idCliente,
    codigo: codigo,
    nome: nome,
    cpf: cpf,
    rg: rg,
    endereco: endereco,
    dataNasc: dataNasc,
    contato: contato,
    email: email,
  );
}
