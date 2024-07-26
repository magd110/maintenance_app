import 'package:dartz/dartz.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/features/add_order/data/models/electrics_model/electrics_model.dart';

abstract class ShowElectricRepo {
  Future<Either<Failure, List<ElectricsModel>>> getElectrics({required String endPoint,required String token,});
}
