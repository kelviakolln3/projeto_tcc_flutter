import '../../../../domain/domain.dart';
import '../../../http/http.dart';

class RemoteDeleteSupplier implements DeleteSupplier {
  final HttpClient httpClient;
  final String url;

  RemoteDeleteSupplier({
    required this.httpClient,
    required this.url
  });

  @override
  Future<bool> delete(int idFornecedor) async {
    try {
      await httpClient.request(url: '$url/$idFornecedor', method: 'delete');
      return true;
    } on HttpError {
      throw DomainError.unexpected;
    }
  }
}