import '../../../../domain/domain.dart';
import '../../../data.dart';

class RemoteEditCustumer implements EditCustumer {
  final HttpClient httpClient;
  final String url;

  RemoteEditCustumer({
    required this.httpClient,
    required this.url
  });

  @override
  Future<CustumerEntity> edit(EditCustumerParams params) async {
    final body = RemoteEditCustumerParams.fromDomain(params).toJson();
    try {
      final httpResponse = await httpClient.request(url: '$url/${params.idCliente}', method: 'put', body: body);
      return RemoteCustumersModel.fromJson(httpResponse).toEntity();
    } on HttpError {
      throw DomainError.unexpected;
    }
  }
}

class RemoteEditCustumerParams {
  final int idCliente;
  final int codigo;
  final String nome;
  final String cpf;
  final String rg;
  final String endereco;
  final String dataNasc;
  final String contato;
  final String email;

  const RemoteEditCustumerParams ({
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

  factory RemoteEditCustumerParams.fromDomain(EditCustumerParams params) => RemoteEditCustumerParams(
    idCliente: params.idCliente,
    codigo: params.codigo,
    nome: params.nome,
    cpf: params.cpf,
    rg: params.rg,
    endereco: params.endereco,
    dataNasc: params.dataNasc,
    contato: params.contato,
    email: params.email
  );

  Map toJson() => {
    'idCliente': idCliente,
    'codigo': codigo,
    'nome': nome,
    'cpf': cpf,
    'rg': rg,
    'endereco': endereco,
    'dataNasc': dataNasc,
    'contato': contato,
    'email': email,
  };
}