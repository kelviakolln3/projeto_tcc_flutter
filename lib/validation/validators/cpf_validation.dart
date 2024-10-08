import '../../presentation/protocols/protocols.dart';
import '../protocols/protocols.dart';
import 'package:equatable/equatable.dart';

class CpfValidation extends Equatable implements FieldValidation {
  @override
  final String field;

  @override
  List get props => [field];

  const CpfValidation(this.field);

  @override
  ValidationError? validate(Map input) {
    final regex = RegExp(r"^\d{3}\.\d{3}\.\d{3}-\d{2}$");
    final isValid = input[field]?.isNotEmpty != true || regex.hasMatch(input[field]);
    return isValid ? null : ValidationError.invalidField;
  }
}