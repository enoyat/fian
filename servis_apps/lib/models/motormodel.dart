import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MotorModel {
  final int idmotor;
  final int iduser;
  final String nopolisi;
  final String idmerk;
  final String jenismerk;
  MotorModel({
    required this.idmotor,
    required this.iduser,
    required this.nopolisi,
    required this.idmerk,
    required this.jenismerk,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idmotor': idmotor,
      'iduser': iduser,
      'nopolisi': nopolisi,
      'idmerk': idmerk,
      'jenismerk': jenismerk,
    };
  }

  factory MotorModel.fromMap(Map<String, dynamic> map) {
    return MotorModel(
      idmotor: map['idmotor'] as int,
      iduser: map['iduser'] as int,
      nopolisi: map['nopolisi'] as String,
      idmerk: map['idmerk'] as String,
      jenismerk: map['jenismerk'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MotorModel.fromJson(String source) => MotorModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
