import 'dart:ffi';

import 'package:formz/formz.dart';

enum EmpsalaryValidationError { empty }

class Empsalary extends FormzInput<Double, EmpsalaryValidationError> {
  Empsalary.pure(value) : super.pure(value);
  Empsalary.dirty([value = "0.0"]) : super.dirty(value);

  @override
  EmpsalaryValidationError? validator(Double? value) {
    //throw UnimplementedError();
    return value == null ? null : EmpsalaryValidationError.empty;
  }
}
