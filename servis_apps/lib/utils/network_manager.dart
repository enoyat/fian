// ignore_for_file: public_member_api_docs, sort_constructors_first, empty_catches
import 'package:servis_apps/models/pendaftaran.dart';
import "package:dio/dio.dart";
import '../models/history.dart';
import '../models/jadwal.dart';
import '../models/pendaftaramodel.dart';
import '../models/rekam.dart';

class NetworkManager {
  late Dio dio;
  final String baseUrl = "http://192.168.10.254:8000/api";

  NetworkManager() {
    dio = Dio();
  }
  Future login(String email, String password) async {
    try {
      final result = await dio.post(
        '$baseUrl/login',
        data: {
          "email": email,
          "password": password,
        },
      );
      return result.data;
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }

  Future<List<Jadwal>> jadwal() async {
    try {
      final result = await dio.get('$baseUrl/jadwal');
      return (result.data as List)
          .map((e) => Jadwal.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }

  Future<List<PendaftaranModel>> listpendaftaran(int id) async {
    try {
      final result = await dio.get('$baseUrl/listpendaftaran/$id');

      return (result.data as List)
          .map((e) => PendaftaranModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }

  Future<void> postTransaction(Pendaftaran item) async {
    try {
      final result = await dio.post(
        "$baseUrl/jadwal",
        data: item.toMap(),
      );

      return result.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<History>> listtransaction(int id) async {
    try {
      final result =
          await dio.get('$baseUrl/transaction/listtransaction?customerid=$id');
      return (result.data as List)
          .map((e) => History.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }

  Future<List<Rekam>> listrekam(int id) async {
    try {
      final result = await dio.get('$baseUrl/listrekam/$id');
      print(result.data);
      return (result.data as List)
          .map((e) => Rekam.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }

  Future<void> delete(History item) async {
    try {
      final result = await dio.delete(
        "$baseUrl/deletehistory/${item.id}",
      );
      return result.data;
    } catch (e) {}
  }
}
