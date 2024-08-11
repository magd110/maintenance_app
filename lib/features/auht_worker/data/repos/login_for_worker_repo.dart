import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:maintenance_app1/core/errors/failures.dart';
import 'package:maintenance_app1/features/auht_worker/data/models/login_for_worker_model/login_for_worker_model.dart';

abstract class LoginForWorkerRepo {
  Future<Either<Failure, LoginForWorkerModel>> loginForWorker({required String endPoint,required String email,required String password,});
}
