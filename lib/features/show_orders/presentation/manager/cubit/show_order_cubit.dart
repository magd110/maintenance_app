import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maintenance_app1/features/show_orders/data/models/show_orders_model/show_orders_model.dart';
import 'package:maintenance_app1/features/show_orders/data/repos/show_orders_repo.dart';

part 'show_order_state.dart';

class ShowOrderCubit extends Cubit<ShowOrderState> {
  final ShowOrdersRepo showOrdersRepo;
  ShowOrderCubit(this.showOrdersRepo) : super(ShowOrderInitial());

  Future<void> showOrders({
    required String endPoint,
    required String token,
  }) async {
    emit(ShowOrderLoadingState());
    var data = await showOrdersRepo.showOrders(
      token: token,
      endPoint: endPoint,
    );
    data.fold((l) {
      emit(ShowOrderFailureState(l.eerMessage));
    }, (r) {
      emit(ShowOrderSuccessState(r));
    });
  }
}
