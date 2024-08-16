import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maintenance_app1/features/vacation%20_request/data/models/request_leave_model/request_leave_model.dart';
import 'package:maintenance_app1/features/vacation%20_request/data/repos/requese_leave_repo.dart';

part 'request_leave_state.dart';

class RequestLeaveCubit extends Cubit<RequestLeaveState> {
  final RequestLeaveRepo requestLeaveRepo;
  RequestLeaveCubit(this.requestLeaveRepo) : super(RequestLeaveInitial());

  Future<void> requstLeave(
      {required String token,
      required String endPoint,
      required String reason}) async {
    emit(RequestLeaveLoadingState());
    var data = await requestLeaveRepo.requeseLeave(
      endPoint: endPoint,
      token: token,
      reason: reason,
    );

    data.fold((l) {
      emit(RequestLeaveFailureState(l.eerMessage));
    }, (r) {
      emit(RequestLeaveSuccessState(r));
    });
  }
}
