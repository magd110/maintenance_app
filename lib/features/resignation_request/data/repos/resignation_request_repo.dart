import 'package:dartz/dartz.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/features/resignation_request/data/models/resignation_model/resignation_model.dart';

abstract class ResignationRequestRepo {
  Future<Either<Failure, ResignationModel>> resignationRequest({
    required String endPoint,
    required String token,
    required String reason,
    required String idapplication,
  });
}
