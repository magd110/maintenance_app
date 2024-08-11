part of 'login_for_worker_cubit.dart';

sealed class LoginForWorkerState extends Equatable {
  const LoginForWorkerState();

  @override
  List<Object> get props => [];
}

final class LoginForWorkerInitial extends LoginForWorkerState {}

final class LoginForWorkerLoadingState extends LoginForWorkerState {}

final class LoginForWorkerFailureState extends LoginForWorkerState {
  final String errorMessage;

  const LoginForWorkerFailureState(this.errorMessage);
}

final class LoginForWorkerSuccessState extends LoginForWorkerState {
 final LoginForWorkerModel loginForWorkerModel;

  const LoginForWorkerSuccessState(this.loginForWorkerModel);
}
