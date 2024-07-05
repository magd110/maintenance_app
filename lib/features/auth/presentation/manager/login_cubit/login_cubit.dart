import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maintenance_app1/features/auth/data/models/login_model/login_model.dart';
import 'package:maintenance_app1/features/auth/data/repos/login/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
    required String endPoint,
  }) async {
    emit(LoginLoadingState());
    var data = await loginRepo.login(
      email: email,
      password: password,
      endPoint: endPoint,
    );
    data.fold((l) {
      emit(LoginFailureState(l.eerMessage));
    }, (r) {
      emit(LoginSuccessState(r));
    });
  }
}
