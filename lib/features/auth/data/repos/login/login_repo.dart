import 'package:dartz/dartz.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/features/auth/data/models/login_model/login_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
    required String endPoint,
  });
}
