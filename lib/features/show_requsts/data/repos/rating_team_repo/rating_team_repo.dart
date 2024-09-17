import 'package:dartz/dartz.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/features/show_requsts/data/models/rating_model/rating_model.dart';

abstract class RatingTeamRepo {
  Future<Either<Failure, RatingModel>> rating({required String endPoint,
    required String token,
    required String note,
    required double numberOfStar,
    required int teamId,});
}
