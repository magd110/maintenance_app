import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/features/add_order/data/models/store_request_by_user_model/store_request_by_user_model.dart';

abstract class StoreRequestByUserRepo {
  Future<Either<Failure, StoreRequestByUserModel>> storeRequest({
    required XFile image,
    required double latitude,
    required double longitude,
    required String phoneNumber,
    required String details,
    required String notes,
    required String days,
    required int id,
    required String endPoint,
    required String token,
  });
}
