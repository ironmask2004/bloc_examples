import 'package:flutter/material.dart';

import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -1 / 3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _EmpnameInput(),
          const Padding(padding: EdgeInsets.all(12)),
          _AddressInput(),
          const Padding(padding: EdgeInsets.all(12)),
          _SalaryInput(),
          const Padding(padding: EdgeInsets.all(12)),
          _SaveButton(),
        ],
      ),
    );
  }
}

class _EmpnameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('Card_Form_empnameInput_textField'),
      onChanged: (empname) => print('Employ Name Changed'),
      decoration: InputDecoration(
        labelText: 'empname',
        errorText: 'invalid empname',
      ),
    );
  }
}

class _AddressInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('Emp_Card__Address_Input_textField'),
      onChanged: (Address) => print("Address Changed"),
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Address',
        errorText: 'invalid slary',
      ),
    );
  }
}

class _SalaryInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('Emp_Card__salary_Input_textField'),
      onChanged: (salary) => print("Salary Changed"),
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Salary',
        errorText: 'invalid slary',
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        key: const Key('Emp_Card_Form_continue_raisedButton'),
        child: const Text('Save Card'),
        onPressed: () {
          print('Save Pressed');
        });
  }
}
