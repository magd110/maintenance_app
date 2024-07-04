import 'package:flutter/material.dart';
import 'package:maintenance_app1/features/login_customer/presentation/views/widgets/sign_form.dart';

import 'widgets/register_section.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
           appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'Maintenance',
            style: TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              color: Colors.blue[800],
              shadows: [
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 3.0,
                  color: Colors.grey[500]!,
                ),
              ],
            ),
          ),
        ),
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "images/x.png",
              ),
              opacity: 0.1,
            )),
            child: ListView(
              children: [
                //const TextSection(),

                const RegisterSection(),
              ],
            ),
          ),
        ));
  }
}
