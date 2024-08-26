import '../domain.dart';

abstract class FindCustumer {
  Future<CustumerEntity?> find(int idCliente);
}