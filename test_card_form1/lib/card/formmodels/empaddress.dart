import 'package:formz/formz.dart';

enum EmpaddressValidationError { empty }

class Empaddress extends FormzInput<String, EmpaddressValidationError> {
  Empaddress.pure(String value) : super.pure(value);
  Empaddress.dirty([String value = 'Damascus']) : super.dirty(value);

  @override
  EmpaddressValidationError? validator(String? value) {
    //throw UnimplementedError();
    return value?.isNotEmpty == true ? null : EmpaddressValidationError.empty;
  }
}
