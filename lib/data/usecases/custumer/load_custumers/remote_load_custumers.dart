import '../../../../domain/domain.dart';
import '../../../http/http.dart';
import '../../../models/models.dart';

class RemoteLoadCustumers implements LoadCustumers {
  final HttpClient httpClient;
  final String url;

  RemoteLoadCustumers({
    required this.httpClient,
    required this.url
  });

  @override
  Future<List<CustumerEntity>> load() async {
    try {
      final httpResponse = await httpClient.request(url: url, method: 'get');
      return httpResponse.map<CustumerEntity>((json) => RemoteCustumersModel.fromJson(json).toEntity()).toList();
    } on HttpError {
      DomainError.unexpected;
    }
    return [];
  }
}