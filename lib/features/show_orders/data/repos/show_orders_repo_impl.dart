import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/core/utils/api_service.dart';
import 'package:maintenance_app1/features/show_orders/data/models/show_orders_model/show_orders_model.dart';
import 'package:maintenance_app1/features/show_orders/data/repos/show_orders_repo.dart';

class ShowOrdersRepoImpl implements ShowOrdersRepo {
  final ApiService _apiService;

  ShowOrdersRepoImpl(this._apiService);
  @override
  Future<Either<Failure, ShowOrdersModel>> showOrders(
      {required String token, required String endPoint}) async {
    try {
      var data = await _apiService.showOrders(
        endPoint: endPoint,
        token: token,
      );
      ShowOrdersModel showOrdersModel = ShowOrdersModel.fromJson(data);
      return right(showOrdersModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
