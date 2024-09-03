import '../../../../domain/domain.dart';
import '../../../http/http.dart';

class RemoteDeleteItemOrder implements DeleteItemOrder {
  final HttpClient httpClient;
  final String url;

  RemoteDeleteItemOrder({
    required this.httpClient,
    required this.url
  });

  @override
  Future<bool> delete(int idItemPedido) async {
    try {
      await httpClient.request(url: '$url/$idItemPedido', method: 'delete');
      return true;
    } on HttpError {
      DomainError.unexpected;
      return false;
    }
  }
}