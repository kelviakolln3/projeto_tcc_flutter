import '../../../../presentation/protocols/protocols.dart';
import '../../../../validation/protocols/protocols.dart';
import '../../../builders/builders.dart';
import '../../../composites/composites.dart';

Validation makeOrderValidation() => ValidationComposite(makeOrderValidations());

List<FieldValidation> makeOrderValidations() => [
  ...ValidationBuilder.field('idCliente').required().build(),
  ...ValidationBuilder.field('idUsuario').required().build(),
  ...ValidationBuilder.field('dataCriacao').required().date().build(),
  ...ValidationBuilder.field('condicaoPagamento').required().build(),
  ...ValidationBuilder.field('formaPagamento').required().build(),
  ...ValidationBuilder.field('total').required().build(),
  ...ValidationBuilder.field('observacao').required().build(),
  ...ValidationBuilder.field('itemPedidoBeans').required().build(),
  ...ValidationBuilder.field('itemPedidoBeans').nestedValidations([
    ...ValidationBuilder.field('idProduto').required().build(),
    ...ValidationBuilder.field('quantidade').required().min(1).build(),
    ...ValidationBuilder.field('valorUnitario').required().build(),
  ]).build(),
];