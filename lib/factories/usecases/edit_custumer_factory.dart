import '../../data/data.dart';
import '../../domain/domain.dart';
import '../factories.dart';

EditCustumer makeEditCustumer() => RemoteEditCustumer(
  httpClient: makeHttpAdapter(),
  url: makeApiUrl('cliente')
);