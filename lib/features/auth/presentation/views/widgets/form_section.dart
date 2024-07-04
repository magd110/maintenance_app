import 'package:flutter/material.dart';
import 'package:maintenance_app1/core/widgets/text_button.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/show_electrical.dart';
import 'package:maintenance_app1/features/auth/presentation/views/widgets/login_text_field.dart';

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

    return Form(
      key: keyForm,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center(
            //   child: Padding(
            //     padding: EdgeInsets.only(top: 5.0),
            //     child: Text(
            //       'Maintenance',
            //       style: TextStyle(
            //         fontSize: 35.0,
            //         fontWeight: FontWeight.w700,
            //         fontStyle: FontStyle.italic,
            //         color: Colors.blue[800],
            //         shadows: [
            //           Shadow(
            //             offset: Offset(2.0, 2.0),
            //             blurRadius: 3.0,
            //             color: Colors.grey[500]!,
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(height: height * 0.5),
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
            Center(
              child: SizedBox(
                width: width * 0.5,
                height: height * 0.08,
                child: TextButtonn(
                  backGroundColor: Colors.blue,
                  label: 'تسجيل الدخول ',
                  onPressed: () {
                    if (keyForm.currentState!.validate()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ShowElectrical(),
                        ),
                      );
                      print("object0");
                      if (emailValidate()) {
                        print("object");
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
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
