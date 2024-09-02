import '../../../data/data.dart';
import '../../../domain/domain.dart';
import '../../factories.dart';

DeleteCustumer makeDeleteCustumer() => RemoteDeleteCustumer(
  httpClient: makeHttpAdapter(),
  url: makeApiUrl('cliente')
);