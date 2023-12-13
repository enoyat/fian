import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Rekam {
  final int? id;
  final int idpasien;
  final int iddokter;
  final String tanggal;
  final String subject;
  final String object;
  final String assasment;
  final String plan;
  final String resep;
  final String status;
  final String namadokter;
  Rekam({
    this.id,
    required this.idpasien,
    required this.iddokter,
    required this.tanggal,
    required this.subject,
    required this.object,
    required this.assasment,
    required this.plan,
    required this.resep,
    required this.status,
    required this.namadokter,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idpasien': idpasien,
      'iddokter': iddokter,
      'tanggal': tanggal,
      'subject': subject,
      'object': object,
      'assasment': assasment,
      'plan': plan,
      'resep': resep,
      'status': status,
      'namadokter': namadokter,
    };
  }

  factory Rekam.fromMap(Map<String, dynamic> map) {
    return Rekam(
      id: map['id'] != null ? map['id'] as int : null,
      idpasien: map['idpasien'] as int,
      iddokter: map['iddokter'] as int,
      tanggal: map['tanggal'] as String,
      subject: map['subject'] as String,
      object: map['object'] as String,
      assasment: map['assasment'] as String,
      plan: map['plan'] as String,
      resep: map['resep'] as String,
      status: map['status'] as String,
      namadokter: map['namadokter'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rekam.fromJson(String source) =>
      Rekam.fromMap(json.decode(source) as Map<String, dynamic>);
}
