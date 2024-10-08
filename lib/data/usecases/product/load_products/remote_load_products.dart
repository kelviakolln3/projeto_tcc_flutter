import '../../../../domain/domain.dart';
import '../../../http/http.dart';
import '../../../models/models.dart';

class RemoteLoadProducts implements LoadProducts {
  final HttpClient httpClient;
  final String url;

  RemoteLoadProducts({
    required this.httpClient,
    required this.url
  });

  @override
  Future<List<ProductEntity>> load() async {
    try {
      final httpResponse = await httpClient.request(url: url, method: 'get');
      return httpResponse.map<ProductEntity>((json) => RemoteProductsModel.fromJson(json).toEntity()).toList();
    } on HttpError {
      throw DomainError.unexpected;
    }
  }
}