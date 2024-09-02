import '../domain.dart';

abstract class FindOrder {
  Future<OrderEntity?> find(int idPedido);
}