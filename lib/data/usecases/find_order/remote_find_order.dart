import '../../../domain/domain.dart';
import '../../data.dart';

class RemoteFindOrder implements FindOrder {
  final HttpClient httpClient;
  final String url;

  RemoteFindOrder({
    required this.httpClient,
    required this.url
  });

   @override
   Future<OrderEntity?> find(int idPedido) async {
    try {
      final httpResponse = await httpClient.request(url: '$url/$idPedido', method: 'get');
      return RemoteOrdersModel.fromJson(httpResponse).toEntity();
    } on HttpError {
      DomainError.unexpected;
    }
    return null;
  }
}