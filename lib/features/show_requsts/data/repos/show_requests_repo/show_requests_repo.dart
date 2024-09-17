import 'package:dartz/dartz.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/features/show_requsts/data/models/show_requsts_model/show_requsts_model.dart';

abstract class ShowRequestsRepo {
  Future<Either<Failure, List<ShowRequstsModel>>> showRequests({
    required String endPoint,
    required String token,
  });
}
