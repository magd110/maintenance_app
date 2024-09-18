import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/features/show_qr/data/models/request_inquiry_model/request_inquiry_model.dart';

abstract class RequestInquiryRepo {
  Future<Either<Failure, List<RequestInquiryModel>>> requestInquiry({
    required String endPoint,
    required String token,
    required XFile image,
    required int check,
  });
}
