import '../../../presentation/presenters/presenters.dart';
import '../../../ui/pages/pages.dart';
import '../../factories.dart';

CustumerCreatePresenter makeGetxCustumerCreatePresenter() => GetxCustumerCreatePresenter(
  createCustumer: makeCreateCustumer()
);