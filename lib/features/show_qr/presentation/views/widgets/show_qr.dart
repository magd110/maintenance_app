import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance_app1/core/utils/service_locator.dart';
import 'package:maintenance_app1/features/show_qr/data/repos/request_inquiry_repo/request_inquiry_repo_impl.dart';
import 'package:maintenance_app1/features/show_qr/presentation/manager/request_inquiry_cubit/request_inquiry_cubit.dart';
import 'package:maintenance_app1/features/show_qr/presentation/views/widgets/show_qr_body.dart';

class ShowQr extends StatelessWidget {
  const ShowQr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RequestInquiryCubit(getIt.get<RequestInquiryRepoImpl>()),
        child: const ShowQrBody(),
      ),
    );
  }
}
