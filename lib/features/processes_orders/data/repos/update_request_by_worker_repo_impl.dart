import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/core/utils/api_service.dart';
import 'package:maintenance_app1/features/processes_orders/data/models/update_request_by_worker_model/update_request_by_worker_model.dart';
import 'package:maintenance_app1/features/processes_orders/data/repos/update_request_by_worker_repo.dart';

class UpdateRequestByWorkerRepoImpl implements UpdateRequestByWorkerRepo {
  final ApiService _apiService;

  UpdateRequestByWorkerRepoImpl(this._apiService);
  @override
  Future<Either<Failure, UpdateRequestByWorkerModel>> updateRequestByWorker(
      {required String endPoint,
      required String token,
      required String consumableParts,
      required String repairs,
      required int id}) async {
    try {
      var data = await _apiService.updateRequestByWorker(
        endPoint: endPoint,
        token: token,
        consumableParts: consumableParts,
        repairs: repairs,
        id: id,
      );

      UpdateRequestByWorkerModel updateRequestByWorkerModel =
          UpdateRequestByWorkerModel.fromJson(data);
      return right(updateRequestByWorkerModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
