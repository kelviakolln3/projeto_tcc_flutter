import '../../../../domain/domain.dart';
import '../../../data.dart';

class RemoteFindCustumer implements FindCustumer {
  final HttpClient httpClient;
  final String url;

  RemoteFindCustumer({
    required this.httpClient,
    required this.url
  });

  @override
  Future<CustumerEntity?> find(int idCliente) async {
    try {
      final httpResponse = await httpClient.request(url: '$url/$idCliente', method: 'get');
      return RemoteCustumersModel.fromJson(httpResponse).toEntity();
    } on HttpError {
      DomainError.unexpected;
    }
    return null;
  }
}