import '../domain.dart';

abstract class LoadCustumers {
  Future<List<CustumerEntity>> load();
}