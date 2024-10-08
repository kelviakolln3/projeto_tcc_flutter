import '../../../../presentation/protocols/protocols.dart';
import '../../../../validation/protocols/protocols.dart';
import '../../../builders/builders.dart';
import '../../../composites/composites.dart';

Validation makeProductValidation() => ValidationComposite(makeProductValidations());

List<FieldValidation> makeProductValidations() => [
  ...ValidationBuilder.field('codigo').required().build(),
  ...ValidationBuilder.field('nome').required().build(),
  ...ValidationBuilder.field('codigoBarras').required().build(),
  ...ValidationBuilder.field('estoque').required().build(),
  ...ValidationBuilder.field('grupo').required().build(),
  ...ValidationBuilder.field('marca').required().build(),
  ...ValidationBuilder.field('valorVenda').required().build(),
];