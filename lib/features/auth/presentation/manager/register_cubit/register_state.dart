part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterFailureState extends RegisterState {
  final String errorMessage;

  const RegisterFailureState(this.errorMessage);
}

final class RegisterSuccessState extends RegisterState {
  final RegisterData registerData;

  const RegisterSuccessState(this.registerData);
}
