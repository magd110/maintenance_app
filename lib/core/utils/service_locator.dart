import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:maintenance_app1/core/utils/api_service.dart';
import 'package:maintenance_app1/features/add_order/data/repos/show_electric_repo_impl.dart';
import 'package:maintenance_app1/features/auth/data/repos/login/login_repo_impl.dart';
import 'package:maintenance_app1/features/auth/data/repos/register/register_repo_impl.dart';

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

  getIt.registerSingleton(
    LoginRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton(
    ShowElectricRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
