import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/core/utils/api_service.dart';
import 'package:maintenance_app1/features/add_order/data/models/store_request_by_user_model/store_request_by_user_model.dart';
import 'package:maintenance_app1/features/add_order/data/repos/store_request_by_user_repo/store_request_by_user_repo.dart';

class StoreRequestByUserRepoImpl implements StoreRequestByUserRepo {
  final ApiService _apiService;

  StoreRequestByUserRepoImpl(this._apiService);
  @override
  Future<Either<Failure, StoreRequestByUserModel>> storeRequest(
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
    try {
      var data = await _apiService.storeRequestByUser(
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

      StoreRequestByUserModel storeRequestByUserModel =
          StoreRequestByUserModel.fromJson(data);
      return right(storeRequestByUserModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
