import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/core/utils/api_service.dart';
import 'package:maintenance_app1/features/show_requsts/data/models/show_requsts_model/show_requsts_model.dart';
import 'package:maintenance_app1/features/show_requsts/data/repos/show_requests_repo/show_requests_repo.dart';

class ShowRequestsRepoImpl implements ShowRequestsRepo {
  final ApiService _apiService;

  ShowRequestsRepoImpl(this._apiService);
  @override
  Future<Either<Failure, List<ShowRequstsModel>>> showRequests(
      {required String endPoint, required String token}) async {
    try {
      var data = await _apiService.showRequest(
        endPoint: endPoint,
        token: token,
      );

      List<ShowRequstsModel> requests = [];
      for (var element in data) {
        requests.add(ShowRequstsModel.fromJson(element));
      }

      return right(requests);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
