
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/core/utils/api_service.dart';
import 'package:maintenance_app1/features/show_qr/data/models/request_inquiry_model/request_inquiry_model.dart';
import 'package:maintenance_app1/features/show_qr/data/repos/request_inquiry_repo/request_inquiry_repo.dart';

class RequestInquiryRepoImpl implements RequestInquiryRepo {
  final ApiService _apiService;

  RequestInquiryRepoImpl(this._apiService);

  @override
  Future<Either<Failure, List<RequestInquiryModel>>> requestInquiry({
    required String endPoint,
    required String token,
    required XFile image,
    required int check,
  }) async {
    try {
      var data = await _apiService.requestInquiry(
        endPoint: endPoint,
        token: token,
        image: image,
        check: check,
      );

      List<RequestInquiryModel> requests = [];
      for (var element in data) {
        requests.add(RequestInquiryModel.fromJson(element));
      }

      return right(requests);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
