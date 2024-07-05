import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance_app1/core/widgets/custom_error.dart';
import 'package:maintenance_app1/core/widgets/custom_progress_indicator.dart';
import 'package:maintenance_app1/core/widgets/text_button.dart';
import 'package:maintenance_app1/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:maintenance_app1/features/auth/presentation/views/widgets/login_text_field.dart';

class RegisterSection extends StatefulWidget {
  const RegisterSection({
    super.key,
  });

  @override
  State<RegisterSection> createState() => _RegisterSectionState();
}

class _RegisterSectionState extends State<RegisterSection> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var keyForm = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool emailValidate() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);
  }

  bool passwordValidate(String password) {
    if (password.length >= 6) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocConsumer<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Form(
          key: keyForm,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.4),
                SizedBox(
                  width: width,
                  //  height: height * 0.2,
                  child: LoginTextField(
                    controller: nameController,
                    obscureText: false,
                    hintText: 'أدخل اسمك',
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                SizedBox(
                  width: width,
                  //  height: height * 0.2,
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
                if (state is RegisterFailureState)
                  CustomError(message: state.errorMessage),
                if (state is RegisterLoadingState)
                  const CustomProgressIndicator(),
                Center(
                  child: SizedBox(
                    width: width * 0.5,
                    height: height * 0.08,
                    child: TextButtonn(
                      backGroundColor: Colors.blue,
                      label: 'إنشاء حساب ',
                      onPressed: () async {
                        if (keyForm.currentState!.validate()) {
                          if (emailValidate() &&
                              passwordValidate(passwordController.text)) {
                            await BlocProvider.of<RegisterCubit>(context)
                                .register(
                              endPoint: "register",
                              email: emailController.text,
                              password: passwordController.text,
                              name: nameController.text,
                            );
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
                        "لديك حساب بالفعل؟ قم بتسجيل الدخول.",
                        style: TextStyle(fontSize: 10.0),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "تسجيل الدخول",
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, RegisterState state) {
        if (state is RegisterSuccessState) {
          if (state.registerData.user!.role == "user") {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: const Text("تم تسجيل الحساب بنجاح "),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Ok"),
                  ),
                ],
              ),
            );
          }
        }
      },
    );
  }
}
