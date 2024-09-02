import '../domain.dart';

abstract class LoadOrders {
  Future<List<OrderEntity>> load();
}