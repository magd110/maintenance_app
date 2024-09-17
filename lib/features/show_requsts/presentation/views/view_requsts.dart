import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance_app1/core/utils/service_locator.dart';
import 'package:maintenance_app1/core/utils/shared_preference_store.dart';
import 'package:maintenance_app1/features/show_requsts/data/repos/show_requests_repo/show_requests_repo_impl.dart';
import 'package:maintenance_app1/features/show_requsts/presentation/manager/show_requests_cubit/show_requsts_cubit.dart';
import 'package:maintenance_app1/features/show_requsts/presentation/views/widgets/order_list_page.dart';

class ShowRequsts extends StatelessWidget {
  const ShowRequsts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ShowRequstsCubit(getIt.get<ShowRequestsRepoImpl>())
          ..showRequsts(
            endPoint: 'showrequestuser',
            token: prefs.getString('token')!,
          ),
        child: const OrderListPage(),
      ),
    );
  }
}
