// ignore_for_file: public_member_api_docs, sort_constructors_first, empty_catches
import "package:dio/dio.dart";
import "package:servis_apps/models/merkmodel.dart";

class MerkDio   {
  late Dio dio;
  final String baseUrl = "http://192.168.10.254:8000/api";

  MerkDio() {
    dio = Dio();
  }

  Future<List<Merkmodel>> listmerk() async {
    try {
      final result = await dio.get('$baseUrl/merk/listmerk');
    
      return (result.data as List)
          .map((e) => Merkmodel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Exception occured: $e");
    }
  }


  Future<void> postmerk(Merkmodel item) async {
    try {
      final result = await dio.post(
        "$baseUrl/merk",
        data: item.toMap(),
      );

      return result.data;
    } catch (e) {
      throw Exception(e);
    }
  }


  Future<void> delete(Merkmodel item) async {
    try {
      final result = await dio.delete(
        "$baseUrl/delete/${item.idmerk}",
      );
      return result.data;
    } catch (e) {}
  }
}
