part of 'update_request_by_worker_cubit.dart';

sealed class UpdateRequestByWorkerState extends Equatable {
  const UpdateRequestByWorkerState();

  @override
  List<Object> get props => [];
}

final class UpdateRequestByWorkerInitial extends UpdateRequestByWorkerState {}

final class UpdateRequestByWorkerLoadingState
    extends UpdateRequestByWorkerState {}

final class UpdateRequestByWorkerFailureState
    extends UpdateRequestByWorkerState {
  final String errorMessage;

  const UpdateRequestByWorkerFailureState(this.errorMessage);
}

final class UpdateRequestByWorkerSuccessState
    extends UpdateRequestByWorkerState {
  final UpdateRequestByWorkerModel updateRequestByWorkerModel;

  const UpdateRequestByWorkerSuccessState(this.updateRequestByWorkerModel);
}
