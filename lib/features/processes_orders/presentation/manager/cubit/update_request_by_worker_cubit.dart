import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maintenance_app1/features/processes_orders/data/models/update_request_by_worker_model/update_request_by_worker_model.dart';
import 'package:maintenance_app1/features/processes_orders/data/repos/update_request_by_worker_repo.dart';

part 'update_request_by_worker_state.dart';

class UpdateRequestByWorkerCubit extends Cubit<UpdateRequestByWorkerState> {
  final UpdateRequestByWorkerRepo updateRequestByWorkerRepo;
  UpdateRequestByWorkerCubit(this.updateRequestByWorkerRepo)
      : super(UpdateRequestByWorkerInitial());

  Future<void> updateRequest({
    required String endPoint,
    required String token,
    required String consumableParts,
    required String repairs,
    required int id,
  }) async {
    emit(UpdateRequestByWorkerLoadingState());
    var data = await updateRequestByWorkerRepo.updateRequestByWorker(
      endPoint: endPoint,
      token: token,
      consumableParts: consumableParts,
      repairs: repairs,
      id: id,
    );

    data.fold((l) {
      emit(UpdateRequestByWorkerFailureState(l.eerMessage));
    }, (r) {
      emit(UpdateRequestByWorkerSuccessState(r));
    });
  }
}
