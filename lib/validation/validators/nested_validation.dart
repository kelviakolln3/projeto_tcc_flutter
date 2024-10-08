import '../../presentation/protocols/protocols.dart';
import '../../validation/protocols/protocols.dart';
import 'package:equatable/equatable.dart';

class NestedValidation extends Equatable implements FieldValidation {
  @override
  final String field;
  final List<FieldValidation> validations;

  @override
  List get props => [field];

  const NestedValidation(this.field, this.validations);

  @override
  ValidationError? validate(Map input) {
    final list = input[field];

    if (list == null || list is! List) {
      return ValidationError.requiredList;
    }

    for (final item in list) {
      final result = _validateItem(item);
      if (result != null) {
        return result; // Retorna o primeiro erro encontrado
      }
    }

    return null; // Validação bem-sucedida
  }

  ValidationError? _validateItem(Map<String, dynamic> item) {
    for (final validation in validations) {
      final result = validation.validate(item);
      if (result != null) {
        return ValidationError.requiredField; // Retorna o erro da validação
      }
    }
    return null;
  }
}
