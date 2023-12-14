import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterModel {
  final int? id;
  final String name;
  final String email;
  final String gender;
  final String address;
  final String birthday;
  final String tempat;
  final String agama;
  final String pekerjaan;
  final String status;
  final String idkartu;
  final String nokartu;
  final String nohp;
  final String kelurahan;
  final String statuskeluarga;
  final String password;
  RegisterModel({
    this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.address,
    required this.birthday,
    required this.tempat,
    required this.agama,
    required this.pekerjaan,
    required this.status,
    required this.idkartu,
    required this.nokartu,
    required this.nohp,
    required this.kelurahan,
    required this.statuskeluarga,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'gender': gender,
      'address': address,
      'birthday': birthday,
      'tempat': tempat,
      'agama': agama,
      'pekerjaan': pekerjaan,
      'status': status,
      'idkartu': idkartu,
      'nokartu': nokartu,
      'nohp': nohp,
      'kelurahan': kelurahan,
      'statuskeluarga': statuskeluarga,
      'password': password,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      email: map['email'] as String,
      gender: map['gender'] as String,
      address: map['address'] as String,
      birthday: map['birthday'] as String,
      tempat: map['tempat'] as String,
      agama: map['agama'] as String,
      pekerjaan: map['pekerjaan'] as String,
      status: map['status'] as String,
      idkartu: map['idkartu'] as String,
      nokartu: map['nokartu'] as String,
      nohp: map['nohp'] as String,
      kelurahan: map['kelurahan'] as String,
      statuskeluarga: map['statuskeluarga'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) =>
      RegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
