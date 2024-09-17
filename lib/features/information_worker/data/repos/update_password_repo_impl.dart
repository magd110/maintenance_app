import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/core/utils/api_service.dart';
import 'package:maintenance_app1/features/information_worker/data/models/update_password_model.dart';
import 'package:maintenance_app1/features/information_worker/data/repos/update_password_repo.dart';

class UpdatePasswordRepoImpl implements UpdatePasswordRepo {
  final ApiService apiService;

  UpdatePasswordRepoImpl(this.apiService);
  @override
  Future<Either<Failure, UpdatePasswordModel>> updatePassword(
      {required String endPoint,
      required String token,
      required String newPassword}) async {
    try {
      var data = await apiService.updatePassword(
        endPoint: endPoint,
        token: token,
        newPassword: newPassword,
      );
      UpdatePasswordModel updatePasswordModel =
          UpdatePasswordModel.fromJson(data);
      return right(updatePasswordModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
