import 'package:dartz/dartz.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/features/show_orders/data/models/show_orders_model/show_orders_model.dart';

abstract class ShowOrdersRepo {
  Future<Either<Failure, ShowOrdersModel>> showOrders({required String token,required String endPoint,});
}
