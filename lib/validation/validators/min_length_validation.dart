import '../../presentation/protocols/protocols.dart';
import '../protocols/protocols.dart';

import 'package:equatable/equatable.dart';

class MinLengthValidation extends Equatable implements FieldValidation {
  @override
  final String field;
  final int size;

  @override
  List get props => [field, size];

  const MinLengthValidation({ required this.field, required this.size});

  @override
  ValidationError? validate(Map input) =>
    input[field] != null
    && input[field].length >= size
      ? null
      : ValidationError.invalidField;
}