import '../../validation/protocols/protocols.dart';
import '../../validation/validators/validators.dart';

class ValidationBuilder {
  static ValidationBuilder? _instance;
  String fieldName;
  List<FieldValidation> validations = [];

  ValidationBuilder._(this.fieldName);

  static ValidationBuilder field(String fieldName) {
    _instance = ValidationBuilder._(fieldName);
    return _instance!;
  }

  ValidationBuilder required() {
    validations.add(RequiredFieldValidation(fieldName));
    return this;
  }

  ValidationBuilder email() {
    validations.add(EmailValidation(fieldName));
    return this;
  }

  ValidationBuilder phone() {
    validations.add(PhoneValidation(fieldName));
    return this;
  }

  ValidationBuilder date() {
    validations.add(DateValidation(fieldName));
    return this;
  }

  ValidationBuilder cpf() {
    validations.add(CpfValidation(fieldName));
    return this;
  }

  ValidationBuilder min(int size) {
    validations.add(MinLengthValidation(field: fieldName, size: size));
    return this;
  }

  ValidationBuilder sameAs(String fieldToCompare) {
    validations.add(CompareFieldsValidation(field: fieldName, fieldToCompare: fieldToCompare));
    return this;
  }

  ValidationBuilder list() {
    validations.add(ListValidation(fieldName));
    return this;
  }

  ValidationBuilder nestedValidations(List<FieldValidation> nestedValidations) {
    validations.add(NestedValidation(fieldName, nestedValidations));
    return this;
  }

  List<FieldValidation> build() => validations;
}