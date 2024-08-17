import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/core/utils/api_service.dart';
import 'package:maintenance_app1/features/vacation%20_request/data/models/request_leave_model/request_leave_model.dart';
import 'package:maintenance_app1/features/vacation%20_request/data/repos/requese_leave_repo.dart';

class RequestLeaveRepoImpl implements RequestLeaveRepo {
  final ApiService _apiService;

  RequestLeaveRepoImpl(this._apiService);
  @override
  Future<Either<Failure, RequestLeaveModel>> requeseLeave({
    required String endPoint,
    required String token,
    required String reason,
    required String idapplication,
  }) async {
    try {
      var data = await _apiService.requestLeave(
        endPoint: endPoint,
        token: token,
        reason: reason,
        idapplication: idapplication,
      );
      RequestLeaveModel requestLeaveModel = RequestLeaveModel.fromJson(data);
      return right(requestLeaveModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
