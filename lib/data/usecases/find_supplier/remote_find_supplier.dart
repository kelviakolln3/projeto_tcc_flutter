import '../../../domain/domain.dart';
import '../../data.dart';

class RemoteFindSupplier implements FindSupplier {
  final HttpClient httpClient;
  final String url;

  RemoteFindSupplier({
    required this.httpClient,
    required this.url
  });

   @override
   Future<SupplierEntity?> find(int idFornecedor) async {
    try {
      final httpResponse = await httpClient.request(url: '$url/$idFornecedor', method: 'get');
      return RemoteSuppliersModel.fromJson(httpResponse).toEntity();
    } on HttpError {
      DomainError.unexpected;
    }
    return null;
  }
}