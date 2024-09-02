import '../../../../domain/domain.dart';
import '../../../http/http.dart';
import '../../../models/models.dart';

class RemoteCreateSupplier implements CreateSupplier {
  final HttpClient httpClient;
  final String url;

  RemoteCreateSupplier({
    required this.httpClient,
    required this.url
  });

  @override
  Future<SupplierEntity?> create(CreateSupplierParams params) async {
    final body = RemoteCreateSupplierParams.fromDomain(params).toJson();
    try {
      final httpResponse = await httpClient.request(url: url, method: 'post', body: body);
      return RemoteSuppliersModel.fromJson(httpResponse).toEntity();
    } on HttpError {
      DomainError.unexpected;
    }
    return null;
  }
}

class RemoteCreateSupplierParams {
  final int codigo;
	final String atividade;
	final String empresa;
	final String contato;
	final String endereco;
	final String email;

  RemoteCreateSupplierParams({
    required this.codigo,
    required this.atividade,
    required this.empresa, 
    required this.contato,
    required this.endereco,
    required this.email
  });

  factory RemoteCreateSupplierParams.fromDomain(CreateSupplierParams params) => RemoteCreateSupplierParams(
    codigo: params.codigo,
    atividade: params.atividade,
    empresa: params.empresa,
    contato: params.contato,
    endereco: params.endereco,
    email: params.email
  );

  Map toJson() => {
    'codigo': codigo,
    'atividade': atividade,
    'empresa': empresa,
    'contato': contato,
    'endereco': endereco,
    'email': email,
  };
}