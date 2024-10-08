import '../../presentation/protocols/protocols.dart';
import '../protocols/protocols.dart';
import 'package:equatable/equatable.dart';

class DateValidation extends Equatable implements FieldValidation {
  @override
  final String field;

  @override
  List get props => [field];

  const DateValidation(this.field);

  @override
  ValidationError? validate(Map input) {
    final regex = RegExp(r"^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$");
    final isValid = input[field]?.isNotEmpty != true || regex.hasMatch(input[field]);
    return isValid ? null : ValidationError.invalidField;
  }
}