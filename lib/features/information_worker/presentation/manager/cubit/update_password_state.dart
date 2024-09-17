part of 'update_password_cubit.dart';

sealed class UpdatePasswordState extends Equatable {
  const UpdatePasswordState();

  @override
  List<Object> get props => [];
}

final class UpdatePasswordInitial extends UpdatePasswordState {}

final class UpdatePasswordLoadingState extends UpdatePasswordState {}

final class UpdatePasswordFailureState extends UpdatePasswordState {
  final String errorMessage;

  const UpdatePasswordFailureState(this.errorMessage);
}

final class UpdatePasswordSuccessState extends UpdatePasswordState {
 final UpdatePasswordModel updatePasswordModel;

  const UpdatePasswordSuccessState(this.updatePasswordModel);
}
