import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maintenance_app1/features/show_qr/data/models/request_inquiry_model/request_inquiry_model.dart';
import 'package:maintenance_app1/features/show_qr/data/repos/request_inquiry_repo/request_inquiry_repo.dart';

part 'request_inquiry_state.dart';

class RequestInquiryCubit extends Cubit<RequestInquiryState> {
  final RequestInquiryRepo requestInquiryRepo;
  RequestInquiryCubit(this.requestInquiryRepo) : super(RequestInquiryInitial());

  Future<void> requestInquiry({
    required String endPoint,
    required String token,
    required XFile image,
    required int check,
  }) async {
    emit(RequestInquiryLoadingState());
    var data = await requestInquiryRepo.requestInquiry(
      endPoint: endPoint,
      token: token,
      image: image,
      check: check,
    );
    data.fold((l) {
      emit(RequestInquiryFailureState(l.eerMessage));
    }, (r) {
      emit(RequestInquirySuccessState(r));
    });
  }
}
