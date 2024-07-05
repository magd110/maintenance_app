import 'dart:async';

import 'package:dio/dio.dart';

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
}
