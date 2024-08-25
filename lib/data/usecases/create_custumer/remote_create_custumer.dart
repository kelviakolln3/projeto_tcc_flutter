import '../../../domain/domain.dart';
import '../../http/http.dart';
import '../../models/models.dart';

class RemoteCreateCustumer implements CreateCustumer {
  final HttpClient httpClient;
  final String url;

  RemoteCreateCustumer({
    required this.httpClient,
    required this.url
  });

  @override
  Future<CustumerEntity?> create(CreateCustumerParams params) async {
    final body = RemoteCreateCustumerParams.fromDomain(params).toJson();
    try {
      final httpResponse = await httpClient.request(url: url, method: 'post', body: body);
      return RemoteCustumersModel.fromJson(httpResponse).toEntity();
    } on HttpError {
      DomainError.unexpected;
    }
    return null;
  }
}

class RemoteCreateCustumerParams {
  final int codigo;
  final String nome;
  final String cpf;
  final String rg;
  final String endereco;
  final String dataNasc;
  final String contato;
  final String email;

  const RemoteCreateCustumerParams ({
    required this.codigo,
    required this.nome,
    required this.cpf,
    required this.rg,
    required this.endereco,
    required this.dataNasc,
    required this.contato,
    required this.email,
  });

  factory RemoteCreateCustumerParams.fromDomain(CreateCustumerParams params) => RemoteCreateCustumerParams(
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