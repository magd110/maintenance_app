import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance_app1/core/utils/my_token.dart';
import 'package:maintenance_app1/core/utils/service_locator.dart';
import 'package:maintenance_app1/core/utils/shared_preference_store.dart';
import 'package:maintenance_app1/features/add_order/data/repos/show_electric_repo_impl.dart';
import 'package:maintenance_app1/features/add_order/presentation/manager/cubit/show_electric_cubit.dart';

import 'widgets/show_electrical_body.dart';

class ShowElectrical extends StatefulWidget {
  const ShowElectrical({super.key});

  @override
  State<ShowElectrical> createState() => _ShowElectricalState();
}

class _ShowElectricalState extends State<ShowElectrical> {

  
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: BlocProvider(
          create: (context) =>
              ShowElectricCubit(getIt.get<ShowElectricRepoImpl>())
                ..getElectrics(endPoint: 'showelectrical', token: prefs.getString('token')!),
          child: const ShowElectricalBody(),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
