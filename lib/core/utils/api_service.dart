import 'dart:async';

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);
  final String _baseUrl = 'http://localhost:8000/api/';

  //final String _baseUrl = 'http://127.0.0.1:8000/api/';

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
}
