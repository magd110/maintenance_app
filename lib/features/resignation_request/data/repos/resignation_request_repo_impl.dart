import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/core/utils/api_service.dart';
import 'package:maintenance_app1/features/resignation_request/data/models/resignation_model/resignation_model.dart';
import 'package:maintenance_app1/features/resignation_request/data/repos/resignation_request_repo.dart';

class ResignationRequestRepoImpl implements ResignationRequestRepo {
  final ApiService _apiService;

  ResignationRequestRepoImpl(this._apiService);
  @override
  Future<Either<Failure, ResignationModel>> resignationRequest(
      {required String endPoint,
      required String token,
      required String reason}) async {
    try {
      var data = await _apiService.resignationRequest(
        endPoint: endPoint,
        token: token,
        reason: reason,
      );
      ResignationModel resignationModel = ResignationModel.fromJson(data);
      return right(resignationModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
