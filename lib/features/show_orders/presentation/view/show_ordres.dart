import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance_app1/core/utils/service_locator.dart';
import 'package:maintenance_app1/core/utils/shared_preference_store.dart';
import 'package:maintenance_app1/features/show_orders/data/repos/show_orders_repo_impl.dart';
import 'package:maintenance_app1/features/show_orders/presentation/manager/cubit/show_order_cubit.dart';
import 'package:maintenance_app1/features/show_orders/presentation/view/widgets/show_orders_body.dart';

class ShowOrdresPage extends StatelessWidget {
  const ShowOrdresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Directionality(
        textDirection: TextDirection.rtl,
        child: BlocProvider(
          create: (context) => ShowOrderCubit(getIt.get<ShowOrdersRepoImpl>())..showOrders(endPoint: 'showRequest', token: prefs.getString('token_worker')!),
          child: const ShowOrdersBody(),
        ),);
  }
}
