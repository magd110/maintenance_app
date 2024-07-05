import 'package:dartz/dartz.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/features/auth/data/models/register_data/register_data.dart';

abstract class RegisterRepo {
  Future<Either<Failure, RegisterData>> register({
    required String name,
    required String email,
    required String password,
    required String endPoint,
  });
}
