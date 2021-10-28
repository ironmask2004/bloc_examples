import 'package:formz/formz.dart';

enum EmpnameValidationError { empty }

class Empname extends FormzInput<String, EmpnameValidationError> {
  Empname.pure(String value) : super.pure(value);
  Empname.dirty([String value = 'KFlihan']) : super.dirty(value);

  @override
  EmpnameValidationError? validator(String? value) {
    //throw UnimplementedError();
    return value?.isNotEmpty == true ? null : EmpnameValidationError.empty;
  }
}
