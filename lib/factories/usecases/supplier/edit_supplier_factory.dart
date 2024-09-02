import '../../../data/data.dart';
import '../../../domain/domain.dart';
import '../../factories.dart';

EditSupplier makeEditSupplier() => RemoteEditSupplier(
  httpClient: makeHttpAdapter(),
  url: makeApiUrl('produto')
);