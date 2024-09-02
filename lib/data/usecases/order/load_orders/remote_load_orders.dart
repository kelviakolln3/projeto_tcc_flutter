import '../../../../domain/domain.dart';
import '../../../http/http.dart';
import '../../../models/models.dart';

class RemoteLoadOrders implements LoadOrders {
  final HttpClient httpClient;
  final String url;

  RemoteLoadOrders({
    required this.httpClient,
    required this.url
  });

  @override
  Future<List<OrderEntity>> load() async {
    try {
      final httpResponse = await httpClient.request(url: url, method: 'get');
      return httpResponse.map<OrderEntity>((json) => RemoteOrdersModel.fromJson(json).toEntity()).toList();
    } on HttpError {
      DomainError.unexpected;
    }
    return [];
  }
}