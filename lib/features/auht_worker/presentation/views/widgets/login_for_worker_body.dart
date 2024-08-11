import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance_app1/core/utils/shared_preference_store.dart';
import 'package:maintenance_app1/core/widgets/custom_error.dart';
import 'package:maintenance_app1/core/widgets/custom_progress_indicator.dart';
import 'package:maintenance_app1/core/widgets/text_button.dart';
import 'package:maintenance_app1/features/auht_worker/presentation/manager/cubit/login_for_worker_cubit.dart';
import 'package:maintenance_app1/features/processes_orders/presentation/views/processes_orders.dart';
import 'package:maintenance_app1/features/show_orders/presentation/view/show_ordres.dart';

class LoginForWorkerBody extends StatefulWidget {
  const LoginForWorkerBody({
    super.key,
  });

  @override
  State<LoginForWorkerBody> createState() => _LoginForWorkerBodyState();
}

class _LoginForWorkerBodyState extends State<LoginForWorkerBody> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var keyForm = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool emailValidate() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocConsumer<LoginForWorkerCubit, LoginForWorkerState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: keyForm,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.5),
                  SizedBox(
                    width: width,
                    child: TextFormField(
                      controller: emailController,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        hintText: "البريد الإلكتروني",
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                        ),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "ادخل البريد الإلكتروني !";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  SizedBox(
                    child: TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        hintText: "كلمة المرور",
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                        ),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "ادخل كلمة المرور !";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  state is LoginForWorkerLoadingState
                      ? const CustomProgressIndicator()
                      : Center(
                          child: SizedBox(
                            width: width * 0.5,
                            height: height * 0.08,
                            child: TextButtonn(
                              backGroundColor: Colors.blue,
                              label: 'تسجيل الدخول ',
                              onPressed: () async {
                                if (keyForm.currentState!.validate()) {
                                  if (emailValidate()) {
                                    await BlocProvider.of<LoginForWorkerCubit>(
                                            context)
                                        .loginForWorker(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      endPoint: 'login',
                                    );
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                  if (state is LoginForWorkerFailureState)
                    CustomError(message: state.errorMessage)
                ],
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, LoginForWorkerState state) async {
        if (state is LoginForWorkerSuccessState) {
          bool result = await prefs.setString(
              'token_worker', state.loginForWorkerModel.accessToken!);
          
          if (state.loginForWorkerModel.accessToken!.isNotEmpty) {
            // ignore: use_build_context_synchronously
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ShowOrdresPage(),
              ),
            );
          }
        }
      },
    );
  }
}
