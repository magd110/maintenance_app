import 'package:flutter/material.dart';
import 'package:maintenance_app1/core/widgets/text_button.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Row(children: [
        const Text(
          "لا تملك حساب؟ قم بإنشاء واحد هنا",
          style:  TextStyle(fontSize: 10.0),
        ),
        SizedBox(
            width: size.width * 0.1,
            height: size.height * 0.08,
            child: TextButtonn(
                backGroundColor: Colors.blue,
                label: 'إنشاء حساب',
                onPressed: () {
                 
                }))
      ]),
    ));
  }
}
