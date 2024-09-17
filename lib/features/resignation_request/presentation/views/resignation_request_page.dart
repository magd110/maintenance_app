import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance_app1/core/utils/service_locator.dart';
import 'package:maintenance_app1/features/resignation_request/data/repos/resignation_request_repo_impl.dart';
import 'package:maintenance_app1/features/resignation_request/presentation/manager/cubit/resignation_cubit.dart';
import 'package:maintenance_app1/features/resignation_request/presentation/views/widgets/resignation_request_body.dart';

class ResignationRequestPage extends StatelessWidget {
  const ResignationRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResignationCubit(getIt.get<ResignationRequestRepoImpl>()),
      child: const ResignationRequestBody(),
    );
  }
}
