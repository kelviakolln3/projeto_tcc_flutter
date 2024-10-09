import '../../../../domain/domain.dart';
import '../../../http/http.dart';

class RemoteDeleteCustumer implements DeleteCustumer {
  final HttpClient httpClient;
  final String url;

  RemoteDeleteCustumer({
    required this.httpClient,
    required this.url
  });

  @override
  Future<bool> delete(int idCliente) async {
    try {
      await httpClient.request(url: '$url/$idCliente', method: 'delete');
      return true;
    } on HttpError {
      throw DomainError.unexpected;
    }
  }
}