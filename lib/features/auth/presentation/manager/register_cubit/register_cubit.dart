import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maintenance_app1/features/auth/data/models/register_data/register_data.dart';
import 'package:maintenance_app1/features/auth/data/repos/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  final RegisterRepo registerRepo;

  Future<void> register({
    required String endPoint,
    required String email,
    required String password,
    required String name,
  }) async {
    emit(RegisterLoadingState());
    
    var data = await registerRepo.register(
      name: name,
      email: email,
      password: password,
      endPoint: endPoint,
    );
    
    data.fold((f) {
      emit(RegisterFailureState(f.eerMessage));
    }, (r) {
      emit(RegisterSuccessState(r));
    });
  }
}
