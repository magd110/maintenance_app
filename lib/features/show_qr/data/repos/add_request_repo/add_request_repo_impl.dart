import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/core/utils/api_service.dart';
import 'package:maintenance_app1/features/show_qr/data/models/add_request_model/add_request_model.dart';
import 'package:maintenance_app1/features/show_qr/data/repos/add_request_repo/add_request_repo.dart';

class AddRequestRepoImpl implements AddRequestRepo {
  final ApiService _apiService;

  AddRequestRepoImpl(this._apiService);

  @override
  Future<Either<Failure, AddRequestModel>> addRequest(
      {required String endPoint,
      required String token,
      required XFile image,
      required int check,
      required String days,
      required String number,
      required double latitude,
      required double longitude,
      required String notes,
      required String details}) async {
    try {
      var data = await _apiService.addRequest(
        endPoint: endPoint,
        token: token,
        image: image,
        check: check,
        days: days,
        number: number,
        latitude: latitude,
        longitude: longitude,
        notes: notes,
        details: details,
      );
      AddRequestModel addRequestModel = AddRequestModel.fromJson(data);
      return right(addRequestModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
