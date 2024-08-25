import '../../../presentation/presenters/presenters.dart';
import '../../../ui/pages/pages.dart';
import '../../factories.dart';

CustumersPresenter makeGetxCustumersPresenter() => GetxCustumersPresenter(
  loadCustumers: makeLoadCustumers(),
);