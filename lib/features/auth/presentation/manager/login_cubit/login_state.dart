part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginFailureState extends LoginState {
  final String errorMessage;

  const LoginFailureState(this.errorMessage);
}

final class LoginSuccessState extends LoginState {
  final LoginModel loginModel;

  const LoginSuccessState(this.loginModel);
}
