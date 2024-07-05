import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/core/utils/api_service.dart';
import 'package:maintenance_app1/features/auth/data/models/login_model/login_model.dart';
import 'package:maintenance_app1/features/auth/data/repos/login/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiService _apiService;

  LoginRepoImpl(this._apiService);
  @override
  Future<Either<Failure, LoginModel>> login(
      {required String email,
      required String password,
      required String endPoint}) async {
    try {
      var data = await _apiService.postForLogin(
        endPoint: endPoint,
        email: email,
        password: password,
      );
      LoginModel loginModel = LoginModel.fromJson(data);
      return right(loginModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
