import 'package:dartz/dartz.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/features/vacation%20_request/data/models/request_leave_model/request_leave_model.dart';

abstract class RequestLeaveRepo {
  Future<Either<Failure, RequestLeaveModel>> requeseLeave({
    required String endPoint,
    required String token,
    required String reason,
    required String idapplication,
  });
}
