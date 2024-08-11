part of 'show_order_cubit.dart';

sealed class ShowOrderState extends Equatable {
  const ShowOrderState();

  @override
  List<Object> get props => [];
}

final class ShowOrderInitial extends ShowOrderState {}

final class ShowOrderLoadingState extends ShowOrderState {}

final class ShowOrderFailureState extends ShowOrderState {
  final String errorMessage;

  const ShowOrderFailureState(this.errorMessage);
}

final class ShowOrderSuccessState extends ShowOrderState {
  final ShowOrdersModel showOrdersModel;

  const ShowOrderSuccessState(this.showOrdersModel);
}
