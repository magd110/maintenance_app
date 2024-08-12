import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance_app1/core/utils/shared_preference_store.dart';
import 'package:maintenance_app1/core/widgets/custom_error.dart';
import 'package:maintenance_app1/core/widgets/custom_progress_indicator.dart';
import 'package:maintenance_app1/core/widgets/text_button.dart';
import 'package:maintenance_app1/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:maintenance_app1/features/auth/presentation/views/widgets/login_text_field.dart';
import 'package:maintenance_app1/features/home_page/presentation/views/home_page.dart';

import '../register_page.dart';

class FormSection extends StatefulWidget {
  const FormSection({
    super.key,
  });

  @override
  State<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
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

    return BlocConsumer<LoginCubit, LoginState>(
      builder: (context, state) => Form(
        key: keyForm,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.5),
              SizedBox(
                width: width,
                child: LoginTextField(
                  controller: emailController,
                  obscureText: false,
                  hintText: 'أدخل بريدك الإلكتروني',
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              SizedBox(
                //  width: width * 0.3,
                // height: screenHeight * 0.5,
                child: LoginTextField(
                  hintText: 'أدخل كلمة المرور',
                  obscureText: true,
                  controller: passwordController,
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              if (state is LoginLoadingState) const CustomProgressIndicator(),
              if (state is LoginFailureState)
                CustomError(message: state.errorMessage),
              Center(
                child: SizedBox(
                  width: width * 0.5,
                  height: height * 0.08,
                  child: TextButtonn(
                    backGroundColor: Colors.blue,
                    label: 'تسجيل الدخول ',
                    onPressed: () async {
                      if (keyForm.currentState!.validate()) {
                        if (emailValidate()) {
                          await BlocProvider.of<LoginCubit>(context).login(
                            email: emailController.text,
                            password: passwordController.text,
                            endPoint: 'login',
                          );
                          // ignore: use_build_context_synchronously
                          //  Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => const  AddOrder(),
                          //   ),
                          // );
                        }
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50.0),
                child: Row(
                  children: [
                    const Text(
                      "لا تملك حساب؟ قم بإنشاء واحد هنا",
                      style: TextStyle(fontSize: 10.0),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "إنشاء حساب",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      listener: (BuildContext context, LoginState state) async {
        if (state is LoginSuccessState) {
          await prefs.setString('token', state.loginModel.accessToken!);
          if (state.loginModel.accessToken!.isNotEmpty) {
            // ignore: use_build_context_synchronously
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          }
        }
      },
    );
  }
}
