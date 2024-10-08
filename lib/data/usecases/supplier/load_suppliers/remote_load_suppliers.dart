import '../../../../domain/domain.dart';
import '../../../http/http.dart';
import '../../../models/models.dart';

class RemoteLoadSuppliers implements LoadSuppliers {
  final HttpClient httpClient;
  final String url;

  RemoteLoadSuppliers({
    required this.httpClient,
    required this.url
  });

  @override
  Future<List<SupplierEntity>> load() async {
    try {
      final httpResponse = await httpClient.request(url: url, method: 'get');
      return httpResponse.map<SupplierEntity>((json) => RemoteSuppliersModel.fromJson(json).toEntity()).toList();
    } on HttpError {
      throw DomainError.unexpected;
    }
  }
}