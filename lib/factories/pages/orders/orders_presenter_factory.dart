import '../../../presentation/presentation.dart';
import '../../../ui/pages/pages.dart';
import '../../factories.dart';

OrdersPresenter makeGetxOrdersPresenter() => GetxOrdersPresenter(
  loadOrders: makeLoadOrders(),
  deleteOrder: makeDeleteOrder()
);