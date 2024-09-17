import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maintenance_app1/features/show_requsts/data/models/rating_model/rating_model.dart';
import 'package:maintenance_app1/features/show_requsts/data/repos/rating_team_repo/rating_team_repo.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  final RatingTeamRepo ratingTeamRepo;
  RatingCubit(this.ratingTeamRepo) : super(RatingInitial());

  Future<void> ratingTeam(
      {required String endPoint,
      required String token,
      required String note,
      required double numberOfStar,
      required int teamId}) async {
    emit(RatingLoadingState());
    var data = await ratingTeamRepo.rating(
      endPoint: endPoint,
      token: token,
      note: note,
      numberOfStar: numberOfStar,
      teamId: teamId,
    );

    data.fold((l) {
      emit(RatingFailureState(l.eerMessage));
    }, (r) {
      emit(RatingSuccessState(r));
    });
  }
}
