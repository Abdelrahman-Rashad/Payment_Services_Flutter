import 'package:dio/dio.dart';

class Dioservices {
  final Dio dio = Dio();

  Future<Response> post(
      {required body,
      required String url,
      required String token,
      String? contentType,
      Map<String, dynamic>? headers}) async {
    var response = await dio.post(
        data: body,
        url,
        options: Options(
            contentType: contentType,
            headers: headers ?? {"Authorization": "Bearer $token"}));

    return response;
  }
}
