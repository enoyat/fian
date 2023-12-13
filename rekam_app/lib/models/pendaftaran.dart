import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Pendaftaran {
  final int idjadwal;
  final int idpasien;
  final int? noantrian;
  final String mediadaftar;
  final String status;
  Pendaftaran({
    required this.idjadwal,
    required this.idpasien,
    this.noantrian,
    required this.mediadaftar,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idjadwal': idjadwal,
      'idpasien': idpasien,
      'noantrian': noantrian,
      'mediadaftar': mediadaftar,
      'status': status,
    };
  }

  factory Pendaftaran.fromMap(Map<String, dynamic> map) {
    return Pendaftaran(
      idjadwal: map['idjadwal'] as int,
      idpasien: map['idpasien'] as int,
      noantrian: map['noantrian'] != null ? map['noantrian'] as int : null,
      mediadaftar: map['mediadaftar'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pendaftaran.fromJson(String source) =>
      Pendaftaran.fromMap(json.decode(source) as Map<String, dynamic>);
}
