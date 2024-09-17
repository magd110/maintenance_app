import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maintenance_app1/features/show_requsts/data/models/show_requsts_model/show_requsts_model.dart';
import 'package:maintenance_app1/features/show_requsts/data/repos/show_requests_repo/show_requests_repo.dart';

part 'show_requsts_state.dart';

class ShowRequstsCubit extends Cubit<ShowRequstsState> {
  final ShowRequestsRepo showRequestsRepo;
  ShowRequstsCubit(this.showRequestsRepo) : super(ShowRequstsInitial());

  Future<void> showRequsts({
    required String endPoint,
    required String token,
  }) async {
    emit(ShowRequstsLoadingState());
    var data = await showRequestsRepo.showRequests(
      endPoint: endPoint,
      token: token,
    );

    data.fold((l) {
      emit(ShowRequstsFailureState(l.eerMessage));
    }, (r) {
      emit(ShowRequstsSuccessState(r));
    });
  }
}
