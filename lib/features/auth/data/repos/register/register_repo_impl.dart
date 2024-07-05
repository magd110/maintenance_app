import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/core/utils/api_service.dart';
import 'package:maintenance_app1/features/auth/data/models/register_data/register_data.dart';
import 'package:maintenance_app1/features/auth/data/repos/register/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  final ApiService _apiService;

  RegisterRepoImpl(this._apiService);
  @override
  Future<Either<Failure, RegisterData>> register(
      {required String name,
      required String email,
      required String password,
      required String endPoint}) async {
    try {
      var data = await _apiService.postForRegister(
        endPoint: endPoint,
        name: name,
        email: email,
        password: password,
      );
      RegisterData registerData = RegisterData.fromJson(data);
      return right(registerData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
