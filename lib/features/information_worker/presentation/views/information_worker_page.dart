import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance_app1/core/utils/service_locator.dart';
import 'package:maintenance_app1/features/information_worker/data/repos/update_password_repo_impl.dart';
import 'package:maintenance_app1/features/information_worker/presentation/manager/cubit/update_password_cubit.dart';
import 'package:maintenance_app1/features/information_worker/presentation/views/widgets/information_worker_body.dart';

class InformationWorkerPage extends StatelessWidget {
  const InformationWorkerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdatePasswordCubit(getIt.get<UpdatePasswordRepoImpl>()),
      child: const InformationWorkerBody(),
    );
  }
}
