import 'package:dartz/dartz.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/features/processes_orders/data/models/update_request_by_worker_model/update_request_by_worker_model.dart';

abstract class UpdateRequestByWorkerRepo {
  Future<Either<Failure, UpdateRequestByWorkerModel>> updateRequestByWorker({
    required String endPoint,
    required String token,
    required String consumableParts,
    required String repairs,
    required int id,
  });
}
