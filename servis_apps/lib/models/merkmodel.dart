import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MerkModel {
  final int idmerk;
  final String jenismerk;
  MerkModel({
    required this.idmerk,
    required this.jenismerk,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idmerk': idmerk,
      'jenismerk': jenismerk,
    };
  }

  factory MerkModel.fromMap(Map<String, dynamic> map) {
    return MerkModel(
      idmerk: map['idmerk'] as int,
      jenismerk: map['jenismerk'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MerkModel.fromJson(String source) => MerkModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
