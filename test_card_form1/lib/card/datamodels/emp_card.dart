import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

enum genderEnum { male, fmale, unkown }

extension GenderToString on genderEnum {
  String get name {
    // return ["male", "fmale", "unkown"][index];
    try {
      return describeEnum(this);
    } catch (err) {
      return 'unkown';
    }
  }
}

genderEnum genderFromString(value) {
  return genderEnum.values.firstWhere(
      (e) => e.toString().split('.')[1].toUpperCase() == value.toUpperCase());
}

extension StrToGender on String {
  genderEnum? get genderValue {
    try {
      return (genderEnum.values.firstWhere((e) =>
          e.toString().split('.')[1].toUpperCase() == this.toUpperCase()));
    } catch (err) {
      return genderEnum.unkown;
    }
  }
}

class EmpCard extends Equatable {
  final String id;
  final String name;
  final String addrees;
  final double salary;
  final genderEnum gender;

  const EmpCard({
    required this.id,
    required this.name,
    required this.addrees,
    required this.salary,
    required this.gender,
  });

  EmpCard copyWith({
    String? id,
    String? name,
    String? addrees,
    double? salary,
    genderEnum? gender,
  }) {
    print(this.salary.toString());
    return EmpCard(
      id: id ?? this.id,
      name: name ?? this.name,
      addrees: addrees ?? this.addrees,
      salary: salary ?? this.salary,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'addrees': addrees,
      'salary': salary,
      'gender': gender.name,
      // 'gender': describeEnum(gender)
    };
  }

  factory EmpCard.fromMap(Map<String, dynamic> map) {
    return EmpCard(
      id: map['id'],
      name: map['name'],
      salary: map['salary'],
      addrees: map['addrees'],
      gender: map['gender'].toString().genderValue!,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmpCard.fromJson(String source) =>
      EmpCard.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name, addrees, salary, gender];
}
