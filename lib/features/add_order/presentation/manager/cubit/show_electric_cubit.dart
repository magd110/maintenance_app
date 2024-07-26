import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maintenance_app1/features/add_order/data/models/electrics_model/electrics_model.dart';
import 'package:maintenance_app1/features/add_order/data/repos/show_electric_repo.dart';

part 'show_electric_state.dart';

class ShowElectricCubit extends Cubit<ShowElectricState> {
  final ShowElectricRepo showElectricRepo;
  ShowElectricCubit(this.showElectricRepo) : super(ShowElectricInitial());

  Future<void> getElectrics({
    required String endPoint,
    required String token,
  }) async {
    emit(ShowElectricLoadingState());
    var data =
        await showElectricRepo.getElectrics(endPoint: endPoint, token: token);
    data.fold((l) {
      emit(ShowElectricFailureState(l.toString()));
    }, (r) {
      emit(ShowElectricSuccessState(r));
    });
  }
}
