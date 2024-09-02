import '../../../../domain/domain.dart';
import '../../../http/http.dart';

class RemoteDeleteProduct implements DeleteProduct {
  final HttpClient httpClient;
  final String url;

  RemoteDeleteProduct({
    required this.httpClient,
    required this.url
  });

  @override
  Future<bool> delete(int idProduto) async {
    try {
      await httpClient.request(url: '$url/$idProduto', method: 'delete');
      return true;
    } on HttpError {
      DomainError.unexpected;
      return false;
    }
  }
}