import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class History {
  final int? id;
  final int customerid;
  final int iddokumen;
  final String? namadokumen;
  final String? catatan;
  final String status;
  final String? filedokumen;
  History({
    this.id,
    required this.customerid,
    required this.iddokumen,
    this.namadokumen,
    this.catatan,
    required this.status,
    this.filedokumen,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'customerid': customerid,
      'iddokumen': iddokumen,
      'namadokumen': namadokumen,
      'catatan': catatan,
      'status': status,
      'filedokumen': filedokumen,
    };
  }

  factory History.fromMap(Map<String, dynamic> map) {
    return History(
      id: map['id'] != null ? map['id'] as int : null,
      customerid: map['customerid'] as int,
      iddokumen: map['iddokumen'] as int,
      namadokumen:
          map['namadokumen'] != null ? map['namadokumen'] as String : null,
      catatan: map['catatan'] != null ? map['catatan'] as String : null,
      status: map['status'] as String,
      filedokumen:
          map['filedokumen'] != null ? map['filedokumen'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory History.fromJson(String source) =>
      History.fromMap(json.decode(source) as Map<String, dynamic>);
}
