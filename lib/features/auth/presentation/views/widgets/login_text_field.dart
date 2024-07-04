import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  const LoginTextField(
      {super.key,
      required this.hintText,
      required this.obscureText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      // keyboardType: TextInputType.emailAddress,
      //controller: nameWorker,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        fillColor: Colors.grey[200],
        hintText: hintText,
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
          if (obscureText == false) {
            return "الرجاء إدخال البريد الإلكتروني ";
          } else {
            return "الرجاء إدخال كلمة المرور";
          }
        }
      },
    );
  }
}
