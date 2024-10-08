import '../../presentation/protocols/protocols.dart';
import '../protocols/protocols.dart';
import 'package:equatable/equatable.dart';

class PhoneValidation extends Equatable implements FieldValidation {
  @override
  final String field;

  @override
  List get props => [field];

  const PhoneValidation(this.field);

  @override
  ValidationError? validate(Map input) {
    final regex = RegExp(r"^\(\d{2}\) \d{5}-\d{4}$");
    final isValid = input[field]?.isNotEmpty != true || regex.hasMatch(input[field]);
    return isValid ? null : ValidationError.invalidField;
  }
}
