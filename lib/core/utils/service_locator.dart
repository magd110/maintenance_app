import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:maintenance_app1/core/utils/api_service.dart';
import 'package:maintenance_app1/features/add_order/data/repos/show_electric_repo/show_electric_repo_impl.dart';
import 'package:maintenance_app1/features/add_order/data/repos/store_request_by_user_repo/store_request_by_user_repo_impl.dart';
import 'package:maintenance_app1/features/auht_worker/data/repos/login_for_worker_repo_impl.dart';
import 'package:maintenance_app1/features/auth/data/repos/login/login_repo_impl.dart';
import 'package:maintenance_app1/features/auth/data/repos/register/register_repo_impl.dart';
import 'package:maintenance_app1/features/show_orders/data/repos/show_orders_repo_impl.dart';

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

  getIt.registerSingleton(
    StoreRequestByUserRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton(
    LoginForWorkerRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton(
    ShowOrdersRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
