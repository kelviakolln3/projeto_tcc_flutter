import '../../../domain/domain.dart';
import '../../data.dart';

class RemoteFindProduct implements FindProduct {
  final HttpClient httpClient;
  final String url;

  RemoteFindProduct({
    required this.httpClient,
    required this.url
  });

   @override
   Future<ProductEntity?> find(int idProduto) async {
    try {
      final httpResponse = await httpClient.request(url: '$url/$idProduto', method: 'get');
      return RemoteProductsModel.fromJson(httpResponse).toEntity();
    } on HttpError {
      DomainError.unexpected;
    }
    return null;
  }
}