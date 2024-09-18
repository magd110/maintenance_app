import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/features/show_qr/data/models/add_request_model/add_request_model.dart';

abstract class AddRequestRepo {
  Future<Either<Failure, AddRequestModel>> addRequest({
    required String endPoint,
    required String token,
    required XFile image,
    required int check,
    required String days,
    required String number,
    required double latitude,
    required double longitude,
    required String notes,
    required String details,
  });
}
