import '../../../domain/domain.dart';
import '../../data.dart';

class RemoteEditSupplier implements EditSupplier {
  final HttpClient httpClient;
  final String url;

  RemoteEditSupplier({
    required this.httpClient,
    required this.url
  });

  @override
  Future<SupplierEntity?> edit(EditSupplierParams params) async {
    final body = RemoteEditSupplierParams.fromDomain(params).toJson();
    try {
      final httpResponse = await httpClient.request(url: '$url/${params.idFornecedor}', method: 'put', body: body);
      return RemoteSuppliersModel.fromJson(httpResponse).toEntity();
    } on HttpError {
      DomainError.unexpected;
    }
    return null;
  }
}

class RemoteEditSupplierParams {
  final int idFornecedor;
  final int codigo;
	final String atividade;
	final String empresa;
	final String contato;
	final String endereco;
	final String email;

  RemoteEditSupplierParams({
    required this.idFornecedor,
    required this.codigo,
    required this.atividade,
    required this.empresa, 
    required this.contato,
    required this.endereco,
    required this.email
  });

  factory RemoteEditSupplierParams.fromDomain(EditSupplierParams params) => RemoteEditSupplierParams(
    idFornecedor: params.idFornecedor, 
    codigo: params.codigo, 
    atividade: params.atividade, 
    empresa: params.empresa, 
    contato: params.contato, 
    endereco: params.endereco, 
    email: params.email,
  );

  Map toJson() => {
    'idFornecedor': idFornecedor,
    'codigo': codigo,
    'atividade': atividade,
    'empresa': empresa,
    'contato': contato,
    'endereco': endereco,
    'email': email,
  };
}
