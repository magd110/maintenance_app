part of 'rating_cubit.dart';

sealed class RatingState extends Equatable {
  const RatingState();

  @override
  List<Object> get props => [];
}

final class RatingInitial extends RatingState {}

final class RatingLoadingState extends RatingState {}

final class RatingFailureState extends RatingState {
  final String errorMessage;

  const RatingFailureState(this.errorMessage);
}

final class RatingSuccessState extends RatingState {
  final RatingModel ratingModel;

  const RatingSuccessState(this.ratingModel);
}
