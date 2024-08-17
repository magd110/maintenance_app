import 'dart:async';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);
  // Majd comment my _baseUrl , don't replace it or delete it
  //final String _baseUrl = 'http://10.0.2.2:8000/api/';
   final String _baseUrl = 'http://localhost:8000/api/';

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

  Future<Map<String, dynamic>> postForLoginWorker(
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

  Future<dynamic> showOrders(
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

  Future<Map<String, dynamic>> updateRequestByWorker({
    required String endPoint,
    required String token,
    required String consumableParts,
    required String repairs,
    required int id,
  }) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: {"consumable_parts": consumableParts, "repairs": repairs, "id": id},
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> requestLeave({
    required String endPoint,
    required String token,
    required String reason,
  }) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: {
        "reason": reason,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return response.data;
  }

  Future<List<dynamic>> showRequest({
    required String endPoint,
    required String token,
  }) async {
    var response = await _dio.get(
      '$_baseUrl$endPoint',
      options: Options(
        headers: {"Authorization": "Bearer $token"},
        method: "GET",
      ),
    );

    return response.data;
  }



  Future<Map<String, dynamic>> ratingTeam({
    required String endPoint,
    required String token,
    required String note,
    required double numberOfStar,
    required int teamId,
  }) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: {
        "star": numberOfStar,
        "maintenance_team_id": teamId,
        "note":note,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return response.data;
  }
}
