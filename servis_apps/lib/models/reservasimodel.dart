import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ReservasiModel {
  final int idreservasi;
  final int idpelayanan;
  final int idmekanik;
  ReservasiModel({
    required this.idreservasi,
    required this.idpelayanan,
    required this.idmekanik,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idreservasi': idreservasi,
      'idpelayanan': idpelayanan,
      'idmekanik': idmekanik,
    };
  }

  factory ReservasiModel.fromMap(Map<String, dynamic> map) {
    return ReservasiModel(
      idreservasi: map['idreservasi'] as int,
      idpelayanan: map['idpelayanan'] as int,
      idmekanik: map['idmekanik'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReservasiModel.fromJson(String source) => ReservasiModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
