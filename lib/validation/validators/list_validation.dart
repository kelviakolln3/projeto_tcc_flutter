import 'package:projeto_tcc_flutter/validation/validators/required_field_validation.dart';

import '../../presentation/protocols/protocols.dart';
import '../../validation/protocols/protocols.dart';
import 'package:equatable/equatable.dart';

class ListValidation extends Equatable implements FieldValidation {
  @override
  final String field;

  @override
  List get props => [field];

  const ListValidation(this.field, {List<RequiredFieldValidation>? validations});

  @override
  ValidationError? validate(Map input) {
    final value = input[field];

    if (value == null || value is! List) {
      return ValidationError.requiredList;
    }
    
    if (value.isEmpty) {
      return ValidationError.invalidList;
    }

    return null;
  }
}
