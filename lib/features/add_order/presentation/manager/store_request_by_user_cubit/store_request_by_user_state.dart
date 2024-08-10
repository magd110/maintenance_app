part of 'store_request_by_user_cubit.dart';

sealed class StoreRequestByUserState extends Equatable {
  const StoreRequestByUserState();

  @override
  List<Object> get props => [];
}

final class StoreRequestByUserInitial extends StoreRequestByUserState {}

final class StoreRequestByUserLoadingState extends StoreRequestByUserState {}

final class StoreRequestByUserFailureState extends StoreRequestByUserState {
  final String errorMessage;

  const StoreRequestByUserFailureState(this.errorMessage);
}

final class StoreRequestByUserSuccessState extends StoreRequestByUserState {
  final StoreRequestByUserModel storeRequestByUserModel;

  const StoreRequestByUserSuccessState(this.storeRequestByUserModel);
}
