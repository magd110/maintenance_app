part of 'request_leave_cubit.dart';

sealed class RequestLeaveState extends Equatable {
  const RequestLeaveState();

  @override
  List<Object> get props => [];
}

final class RequestLeaveInitial extends RequestLeaveState {}

final class RequestLeaveLoadingState extends RequestLeaveState {}

final class RequestLeaveFailureState extends RequestLeaveState {
  final String errorMessage;

  const RequestLeaveFailureState(this.errorMessage);
}

final class RequestLeaveSuccessState extends RequestLeaveState {
 final RequestLeaveModel requestLeaveModel;

  const RequestLeaveSuccessState(this.requestLeaveModel);
}
