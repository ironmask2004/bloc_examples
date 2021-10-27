import 'dart:convert';

import 'package:equatable/equatable.dart';

enum genderEnum { male, fmale, unkown }

extension GenderEnumList on genderEnum {
  static const values = [1, 2, 3];
  int get value => values[index];
}

extension GenderEnumMap on genderEnum {
  static const valueMap = {
    genderEnum.male: 1,
    genderEnum.fmale: 2,
    genderEnum.unkown: 3,
  };

  int? get value => valueMap[this];
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
      'gender': GenderEnumList(gender)
    };
  }

  factory EmpCard.fromMap(Map<String, dynamic> map) {
    return EmpCard(
      id: map['id'],
      name: map['name'],
      addrees: map['addrees'],
      gender: genderEnum.values[map['gender']],
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
