import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PendaftaranModel {
  final int idjadwal;
  final int idpasien;
  final int? noantrian;
  final String mediadaftar;
  final String tanggal;
  final String jam;
  final String namadokter;
  final int jmlpendaftar;
  final String status;
  PendaftaranModel({
    required this.idjadwal,
    required this.idpasien,
    this.noantrian,
    required this.mediadaftar,
    required this.tanggal,
    required this.jam,
    required this.namadokter,
    required this.jmlpendaftar,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idjadwal': idjadwal,
      'idpasien': idpasien,
      'noantrian': noantrian,
      'mediadaftar': mediadaftar,
      'tanggal': tanggal,
      'jam': jam,
      'namadokter': namadokter,
      'jmlpendaftar': jmlpendaftar,
      'status': status,
    };
  }

  factory PendaftaranModel.fromMap(Map<String, dynamic> map) {
    return PendaftaranModel(
      idjadwal: map['idjadwal'] as int,
      idpasien: map['idpasien'] as int,
      noantrian: map['noantrian'] != null ? map['noantrian'] as int : null,
      mediadaftar: map['mediadaftar'] as String,
      tanggal: map['tanggal'] as String,
      jam: map['jam'] as String,
      namadokter: map['namadokter'] as String,
      jmlpendaftar: map['jmlpendaftar'] as int,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PendaftaranModel.fromJson(String source) =>
      PendaftaranModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
