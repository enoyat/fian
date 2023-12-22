// ignore_for_file: public_member_api_docs, sort_constructors_first, empty_catches
import "package:dio/dio.dart";
import "package:servis_apps/models/reservasimodel.dart";

class ReservasiDio   {
  late Dio dio;
  final String baseUrl = "http://192.168.10.254:8000/api";

  ReservasiDio() {
    dio = Dio();
  }
  
  Future<List<ReservasiModel>> listreservasi(int id) async {
    try {
      final result = await dio.get('$baseUrl/reservasi/listreservasi/$id');
      return (result.data as List)
          .map((e) => ReservasiModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }


  Future<void> postReservasi(ReservasiModel item) async {
    try {
      final result = await dio.post(
        "$baseUrl/reservasi",
        data: item.toMap(),
      );

      return result.data;
    } catch (e) {
      throw Exception(e);
    }
  }


  Future<void> delete(ReservasiModel item) async {
    try {
      final result = await dio.delete(
        "$baseUrl/delete/${item.idreservasi}",
      );
      return result.data;
    } catch (e) {}
  }
}
