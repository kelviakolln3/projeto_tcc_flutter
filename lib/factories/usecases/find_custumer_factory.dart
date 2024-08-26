import '../../data/data.dart';
import '../../domain/domain.dart';
import '../factories.dart';

FindCustumer makeFindCustumer() => RemoteFindCustumer(
  httpClient: makeHttpAdapter(),
  url: makeApiUrl('cliente')
);