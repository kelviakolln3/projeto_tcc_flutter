import '../../../../presentation/protocols/protocols.dart';
import '../../../../validation/protocols/protocols.dart';
import '../../../builders/builders.dart';
import '../../../composites/composites.dart';

Validation makeSupplierValidation() => ValidationComposite(makeSupplierValidations());

List<FieldValidation> makeSupplierValidations() => [
  ...ValidationBuilder.field('codigo').required().build(),
  ...ValidationBuilder.field('atividade').required().build(),
  ...ValidationBuilder.field('empresa').required().build(),
  ...ValidationBuilder.field('contato').required().phone().build(),
  ...ValidationBuilder.field('endereco').required().build(),
  ...ValidationBuilder.field('email').required().email().build()
];