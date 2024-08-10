import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maintenance_app1/features/add_order/data/models/store_request_by_user_model/store_request_by_user_model.dart';
import 'package:maintenance_app1/features/add_order/data/repos/store_request_by_user_repo/store_request_by_user_repo.dart';

part 'store_request_by_user_state.dart';

class StoreRequestByUserCubit extends Cubit<StoreRequestByUserState> {
  final StoreRequestByUserRepo storeRequestByUserRepo;
  StoreRequestByUserCubit(this.storeRequestByUserRepo)
      : super(StoreRequestByUserInitial());

  Future<void> storeRequest(
      {required XFile image,
      required double latitude,
      required double longitude,
      required String phoneNumber,
      required String details,
      required String notes,
      required String days,
      required int id,
      required String endPoint,
      required String token}) async {
    emit(StoreRequestByUserLoadingState());
    var data = await storeRequestByUserRepo.storeRequest(
      image: image,
      latitude: latitude,
      longitude: longitude,
      phoneNumber: phoneNumber,
      details: details,
      notes: notes,
      days: days,
      id: id,
      endPoint: endPoint,
      token: token,
    );

    data.fold((l) {
      emit(StoreRequestByUserFailureState(l.eerMessage));
    }, (r) {
      emit(StoreRequestByUserSuccessState(r));
    });
  }
}
