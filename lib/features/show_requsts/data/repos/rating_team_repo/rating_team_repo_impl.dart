import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/core/utils/api_service.dart';
import 'package:maintenance_app1/features/show_requsts/data/models/rating_model/rating_model.dart';
import 'package:maintenance_app1/features/show_requsts/data/repos/rating_team_repo/rating_team_repo.dart';

class RatingTeamRepoImpl implements RatingTeamRepo {
  final ApiService _apiService;

  RatingTeamRepoImpl(this._apiService);
  @override
  Future<Either<Failure, RatingModel>> rating(
      {required String endPoint,
      required String token,
      required String note,
      required double numberOfStar,
      required int teamId}) async {
    try {
      var data = await _apiService.ratingTeam(
        endPoint: endPoint,
        token: token,
        note: note,
        numberOfStar: numberOfStar,
        teamId: teamId,
      );
      RatingModel ratingModel = RatingModel.fromJson(data);
      return right(ratingModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
