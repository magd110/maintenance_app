import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/core/utils/api_service.dart';
import 'package:maintenance_app1/features/auht_worker/data/models/login_for_worker_model/login_for_worker_model.dart';
import 'package:maintenance_app1/features/auht_worker/data/repos/login_for_worker_repo.dart';

class LoginForWorkerRepoImpl implements LoginForWorkerRepo {
  final ApiService _apiService;

  LoginForWorkerRepoImpl(this._apiService);

  @override
  Future<Either<Failure, LoginForWorkerModel>> loginForWorker(
      {required String endPoint,
      required String email,
      required String password}) async {
    try {
      var data = await _apiService.postForLoginWorker(
        endPoint: endPoint,
        email: email,
        password: password,
      );

      LoginForWorkerModel loginForWorkerModel =
          LoginForWorkerModel.fromJson(data);

      return right(loginForWorkerModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
