import 'dart:convert';
//import 'package:reflectable/reflectable.dart';
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

extension strToGender on String {
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
  final genderEnum gender;

  EmpCard({
    required this.id,
    required this.name,
    required this.addrees,
    required this.gender,
  });

  EmpCard copyWith({
    String? id,
    String? name,
    String? addrees,
    genderEnum? gender,
  }) {
    return EmpCard(
      id: id ?? this.id,
      name: name ?? this.name,
      addrees: addrees ?? this.addrees,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'addrees': addrees,
      'gender': gender.name,
      // 'gender': describeEnum(gender)
    };
  }

  factory EmpCard.fromMap(Map<String, dynamic> map) {
    //print(map.toString());
    return EmpCard(
      id: map['id'],
      name: map['name'],
      addrees: map['addrees'],
      //  gender: genderFromString(map['gender']));
      gender: map['gender'].toString().genderValue!,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmpCard.fromJson(String source) =>
      EmpCard.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name, addrees, gender];
}
