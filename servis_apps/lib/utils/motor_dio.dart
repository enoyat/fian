// ignore_for_file: public_member_api_docs, sort_constructors_first, empty_catches
import "package:dio/dio.dart";
import "package:servis_apps/models/motormodel.dart";

class MotorDio   {
  late Dio dio;
  final String baseUrl = "http://192.168.10.254:8000/api";

  MotorDio() {
    dio = Dio();
  }
  
  Future<List<Motor>> listmotor(int id) async {
    try {
      final result = await dio.get('$baseUrl/motor/listmotor/$id');
      return (result.data as List)
          .map((e) => Motor.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }


Future postmotor(Motor item) async {
    try {
      return await dio
          .post(
            "$baseUrl/motor/store",
            data: item.toMap(),
          )
          .then((value) => value.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> delete(Motor item) async {
    try {
      final result = await dio.delete(
        "$baseUrl/delete/${item.idmotor}",
      );
      return result.data;
    } catch (e) {}
  }
}
