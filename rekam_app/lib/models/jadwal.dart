import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Jadwal {
  final int? id;
  final String tanggal;
  final String jam;
  final int iddokter;
  final String namadokter;
  final int? jmlpendaftar;
  final String status;
  Jadwal({
    this.id,
    required this.tanggal,
    required this.jam,
    required this.iddokter,
    required this.namadokter,
    this.jmlpendaftar,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tanggal': tanggal,
      'jam': jam,
      'iddokter': iddokter,
      'namadokter': namadokter,
      'jmlpendaftar': jmlpendaftar,
      'status': status,
    };
  }

  factory Jadwal.fromMap(Map<String, dynamic> map) {
    return Jadwal(
      id: map['id'] != null ? map['id'] as int : null,
      tanggal: map['tanggal'] as String,
      jam: map['jam'] as String,
      iddokter: map['iddokter'] as int,
      namadokter: map['namadokter'] as String,
      jmlpendaftar:
          map['jmlpendaftar'] != null ? map['jmlpendaftar'] as int : null,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Jadwal.fromJson(String source) =>
      Jadwal.fromMap(json.decode(source) as Map<String, dynamic>);
}
