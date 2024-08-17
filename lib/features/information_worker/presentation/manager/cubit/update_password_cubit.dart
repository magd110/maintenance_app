import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maintenance_app1/features/information_worker/data/models/update_password_model.dart';
import 'package:maintenance_app1/features/information_worker/data/repos/update_password_repo.dart';
import 'package:maintenance_app1/features/processes_orders/presentation/manager/cubit/update_request_by_worker_cubit.dart';

part 'update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  final UpdatePasswordRepo updatePasswordRepo;
  UpdatePasswordCubit(this.updatePasswordRepo) : super(UpdatePasswordInitial());

  Future<void> updatePassword({
    required String endPoint,
    required String token,
    required String newPassword,
  }) async {
    emit(UpdatePasswordLoadingState());
    var data = await updatePasswordRepo.updatePassword(
      endPoint: endPoint,
      token: token,
      newPassword: newPassword,
    );

    data.fold((l) {
      emit(UpdatePasswordFailureState(l.eerMessage));
    }, (r) {
      emit(UpdatePasswordSuccessState(r));
    });
  }
}
