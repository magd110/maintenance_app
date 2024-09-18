part of 'add_request_cubit.dart';

sealed class AddRequestState extends Equatable {
  const AddRequestState();

  @override
  List<Object> get props => [];
}

final class AddRequestInitial extends AddRequestState {}

final class AddRequestLoadingState extends AddRequestState {}

final class AddRequestFailureState extends AddRequestState {
  final String errorMessage;

  const AddRequestFailureState(this.errorMessage);
}

final class AddRequestSuccessState extends AddRequestState {
  final AddRequestModel addRequestModel;

  const AddRequestSuccessState(this.addRequestModel);
}
