part of 'show_requsts_cubit.dart';

sealed class ShowRequstsState extends Equatable {
  const ShowRequstsState();

  @override
  List<Object> get props => [];
}

final class ShowRequstsInitial extends ShowRequstsState {}

final class ShowRequstsLoadingState extends ShowRequstsState {}

final class ShowRequstsFailureState extends ShowRequstsState {
  final String errorMessage;

  const ShowRequstsFailureState(this.errorMessage);
}

final class ShowRequstsSuccessState extends ShowRequstsState {
  final List<ShowRequstsModel> requsts;

  const ShowRequstsSuccessState(this.requsts);
}
