part of 'request_inquiry_cubit.dart';

sealed class RequestInquiryState extends Equatable {
  const RequestInquiryState();

  @override
  List<Object> get props => [];
}

final class RequestInquiryInitial extends RequestInquiryState {}

final class RequestInquiryLoadingState extends RequestInquiryState {}

final class RequestInquiryFailureState extends RequestInquiryState {
  final String errorMessage;

  const RequestInquiryFailureState(this.errorMessage);
}

final class RequestInquirySuccessState extends RequestInquiryState {
  final List<RequestInquiryModel> requestInquiryModel;

  const RequestInquirySuccessState(this.requestInquiryModel);
}
