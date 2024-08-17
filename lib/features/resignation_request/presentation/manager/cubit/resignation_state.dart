part of 'resignation_cubit.dart';

sealed class ResignationState extends Equatable {
  const ResignationState();

  @override
  List<Object> get props => [];
}

final class ResignationInitial extends ResignationState {}

final class ResignationLoadingState extends ResignationState {}

final class ResignationFailureState extends ResignationState {
  final String errorMessage;

  const ResignationFailureState(this.errorMessage);
}

final class ResignationSuccessState extends ResignationState {
  final ResignationModel resignationModel;

  const ResignationSuccessState(this.resignationModel);
}
