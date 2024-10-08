import '../../../../presentation/protocols/protocols.dart';
import '../../../../validation/protocols/protocols.dart';
import '../../../builders/builders.dart';
import '../../../composites/composites.dart';

Validation makeCustumerValidation() => ValidationComposite(makeCustumerValidations());

List<FieldValidation> makeCustumerValidations() => [
  ...ValidationBuilder.field('codigo').required().build(),
  ...ValidationBuilder.field('nome').required().build(),
  ...ValidationBuilder.field('cpf').required().min(11).cpf().build(),
  ...ValidationBuilder.field('rg').required().build(),
  ...ValidationBuilder.field('endereco').required().build(),
  ...ValidationBuilder.field('dataNasc').required().date().build(),
  ...ValidationBuilder.field('contato').required().phone().build(),
  ...ValidationBuilder.field('email').required().email().build()
];