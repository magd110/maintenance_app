import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance_app1/core/utils/service_locator.dart';
import 'package:maintenance_app1/features/vacation%20_request/data/repos/request_leave_repo_impl.dart';
import 'package:maintenance_app1/features/vacation%20_request/presentation/manager/cubit/request_leave_cubit.dart';
import 'package:maintenance_app1/features/vacation%20_request/presentation/view/widgets/vacation_request_body.dart';

class VacationRequest extends StatelessWidget {
  const VacationRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => RequestLeaveCubit(getIt.get<RequestLeaveRepoImpl>()),
        child: const VacationRequestBody(),
      ),
    );
  }
}
