import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maintenance_app1/features/resignation_request/data/models/resignation_model/resignation_model.dart';
import 'package:maintenance_app1/features/resignation_request/data/repos/resignation_request_repo.dart';

part 'resignation_state.dart';

class ResignationCubit extends Cubit<ResignationState> {
  final ResignationRequestRepo resignationRequestRepo;
  ResignationCubit(this.resignationRequestRepo) : super(ResignationInitial());

  Future<void> resignationRequest({
    required String endPoint,
    required String token,
    required String reason,
    required String idapplication,
  }) async {
    emit(ResignationLoadingState());
    var data = await resignationRequestRepo.resignationRequest(
      endPoint: endPoint,
      token: token,
      reason: reason,
      idapplication: idapplication,
    );
    data.fold((l) {
      emit(ResignationFailureState(l.eerMessage));
    }, (r) {
      emit(ResignationSuccessState(r));
    });
  }
}
