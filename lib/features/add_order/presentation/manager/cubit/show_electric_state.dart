part of 'show_electric_cubit.dart';

sealed class ShowElectricState extends Equatable {
  const ShowElectricState();

  @override
  List<Object> get props => [];
}

final class ShowElectricInitial extends ShowElectricState {}

final class ShowElectricLoadingState extends ShowElectricState {}

final class ShowElectricFailureState extends ShowElectricState {
  final String errorMessage;

  const ShowElectricFailureState(this.errorMessage);
}

final class ShowElectricSuccessState extends ShowElectricState {
 final List<ElectricsModel> electric;

  const ShowElectricSuccessState(this.electric);
}
