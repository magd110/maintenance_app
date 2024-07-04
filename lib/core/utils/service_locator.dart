import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:maintenance_app1/core/utils/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton(
    ApiService(
      Dio(),
    ),
  );

 
}
