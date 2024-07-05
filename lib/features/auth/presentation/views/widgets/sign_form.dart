import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance_app1/core/utils/service_locator.dart';
import 'package:maintenance_app1/features/auth/data/repos/login/login_repo_impl.dart';
import 'package:maintenance_app1/features/auth/presentation/manager/login_cubit/login_cubit.dart';

import 'form_section.dart';

class SignForm extends StatefulWidget {
  const SignForm({
    super.key,
  });

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children:  [
        BlocProvider(
          create: (context) => LoginCubit(getIt.get<LoginRepoImpl>()),
          child: const FormSection(),
        ),
      ],
    );
  }
}
