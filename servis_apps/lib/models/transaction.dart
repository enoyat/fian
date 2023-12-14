import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Transaction {
  final int? id;
  final int customerid;
  final int iddokumen;
  final String? catatan;
  final String status;
  Transaction({
    this.id,
    required this.customerid,
    required this.iddokumen,
    this.catatan,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'customerid': customerid,
      'iddokumen': iddokumen,
      'catatan': catatan,
      'status': status,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'] != null ? map['id'] as int : null,
      customerid: map['customerid'] as int,
      iddokumen: map['iddokumen'] as int,
      catatan: map['catatan'] != null ? map['catatan'] as String : null,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) =>
      Transaction.fromMap(json.decode(source) as Map<String, dynamic>);
}
