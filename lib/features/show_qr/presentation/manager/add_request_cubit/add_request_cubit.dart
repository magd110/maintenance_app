import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maintenance_app1/features/show_qr/data/models/add_request_model/add_request_model.dart';
import 'package:maintenance_app1/features/show_qr/data/repos/add_request_repo/add_request_repo.dart';

part 'add_request_state.dart';

class AddRequestCubit extends Cubit<AddRequestState> {
  final AddRequestRepo addRequestRepo;
  AddRequestCubit(this.addRequestRepo) : super(AddRequestInitial());

  Future<void> addRequest(
      {required String endPoint,
      required String token,
      required XFile image,
      required int check,
      required String days,
      required String number,
      required double latitude,
      required double longitude,
      required String notes,
      required String details}) async {
    emit(AddRequestLoadingState());
    var data = await addRequestRepo.addRequest(
      endPoint: endPoint,
      token: token,
      image: image,
      check: check,
      days: days,
      number: number,
      latitude: latitude,
      longitude: longitude,
      notes: notes,
      details: details,
    );

    data.fold((l) {
      emit(AddRequestFailureState(l.eerMessage));
    }, (r) {
      emit(AddRequestSuccessState(r));
    });
  }
}
