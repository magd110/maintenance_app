import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maintenance_app1/features/auht_worker/data/models/login_for_worker_model/login_for_worker_model.dart';
import 'package:maintenance_app1/features/auht_worker/data/repos/login_for_worker_repo.dart';

part 'login_for_worker_state.dart';

class LoginForWorkerCubit extends Cubit<LoginForWorkerState> {
  final LoginForWorkerRepo loginForWorkerRepo;
  LoginForWorkerCubit(this.loginForWorkerRepo) : super(LoginForWorkerInitial());

  Future<void> loginForWorker({
    required String email,
    required String password,
    required String endPoint,
  }) async {
    emit(LoginForWorkerLoadingState());
    var data = await loginForWorkerRepo.loginForWorker(
      endPoint: endPoint,
      email: email,
      password: password,
    );
    data.fold((l) {
      emit(LoginForWorkerFailureState(l.eerMessage));
    }, (r) {
      emit(LoginForWorkerSuccessState(r));
    });
  }
}
