import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:maintenance_app1/core/utils/api_service.dart';
import 'package:maintenance_app1/features/auth/data/repos/register_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton(
    RegisterRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
