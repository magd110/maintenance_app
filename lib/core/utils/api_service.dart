import 'dart:async';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  final String _baseUrl = 'http://10.0.2.2:8000/api/';

  Future<Map<String, dynamic>> postForRegister(
      {required String endPoint,
      required String name,
      required String email,
      required String password}) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: {
        "name": name,
        "email": email,
        "password": password,
      },
    );
    return response.data;
  }

  Future<Map<String, dynamic>> postForLogin(
      {required String endPoint,
      required String email,
      required String password}) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: {
        "email": email,
        "password": password,
      },
    );

    return response.data;
  }

  Future<dynamic> getElectric(
      {required String endPoint, required String token}) async {
    var response = await _dio.get(
      '$_baseUrl$endPoint',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> storeRequestByUser({
    required XFile image,
    required double latitude,
    required double longitude,
    required String phoneNumber,
    required String details,
    required String notes,
    required String days,
    required int id,
    required String endPoint,
    required String token,
  }) async {
    String fileName = image.path.split('/').last;

    FormData data = FormData.fromMap({
      "QR_code": await MultipartFile.fromFile(
        image.path,
        filename: fileName,
      ),
      "free_day[]": days,
      "number": phoneNumber,
      "notes": notes,
      "request_details": details,
      "latitude": latitude,
      "longitude": longitude,
      "elec_id": id,
    });

    var response = await _dio.post('$_baseUrl$endPoint',
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ));

    return response.data;
  }
}
