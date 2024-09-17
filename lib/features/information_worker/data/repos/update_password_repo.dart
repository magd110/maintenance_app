import 'package:dartz/dartz.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/features/information_worker/data/models/update_password_model.dart';

abstract class UpdatePasswordRepo {
  Future<Either<Failure, UpdatePasswordModel>> updatePassword({
    required String endPoint,
    required String token,
    required String newPassword,
  });
}
