import '../../../../domain/domain.dart';
import '../../../http/http.dart';

class RemoteDeleteOrder implements DeleteOrder {
  final HttpClient httpClient;
  final String url;

  RemoteDeleteOrder({
    required this.httpClient,
    required this.url
  });

  @override
  Future<bool> delete(int idPedido) async {
    try {
      await httpClient.request(url: '$url/$idPedido', method: 'delete');
      return true;
    } on HttpError {
      throw DomainError.unexpected;
    }
  }
}