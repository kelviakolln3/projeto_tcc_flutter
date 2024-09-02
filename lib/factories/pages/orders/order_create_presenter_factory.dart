import '../../../presentation/presentation.dart';
import '../../../ui/pages/pages.dart';
import '../../factories.dart';

OrderCreatePresenter makeGetxOrderCreatePresenter() => GetxOrderCreatePresenter(
  createOrder: makeCreateOrder()
);