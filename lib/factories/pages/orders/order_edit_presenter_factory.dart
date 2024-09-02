import '../../../presentation/presentation.dart';
import '../../../ui/ui.dart';
import '../../factories.dart';

OrderEditPresenter makeGetxOrderEditPresenter(String idPedido) => GetxOrderEditPresenter(
  findOrder: makeFindOrder(),
  editOrder: makeEditOrder(),
  idPedido: idPedido
);