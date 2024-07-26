import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/core/utils/api_service.dart';
import 'package:maintenance_app1/features/add_order/data/models/electrics_model/electrics_model.dart';
import 'package:maintenance_app1/features/add_order/data/repos/show_electric_repo.dart';

class ShowElectricRepoImpl implements ShowElectricRepo {
  final ApiService _apiService;

  ShowElectricRepoImpl(this._apiService);
  @override
  Future<Either<Failure, List<ElectricsModel>>> getElectrics(
      {required String endPoint, required String token}) async {
    try {
      List<ElectricsModel> electrics = [];

      List<dynamic> data =
          await _apiService.getElectric(endPoint: endPoint, token: token);

      for (var element in data) {
        electrics.add(ElectricsModel.fromJson(element));
      }
      
      return right(electrics);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
