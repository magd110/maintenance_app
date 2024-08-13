import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:maintenance_app1/features/auth/presentation/views/widgets/text_button_icon.dart';

class UserTypeSelectionPageBody extends StatelessWidget {
  const UserTypeSelectionPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: size.height * 0.7,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "images/x.png",
                  ),
                  opacity: 0.7,
                )),
              ),
            ),
          ),
          Container(
            height: size.height * 0.3,
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.elliptical(30, 30),
                    topRight: Radius.elliptical(30, 30))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    height: size.height * 0.05,
                    width: size.width * 0.6,
                    child: Center(
                      child: Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white, // اللون المحدد هنا
                        width: 2.0, // عرض الحدود
                      ),
                    ),
                  ),
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white),
                          height: 2,
                        ),
                      ),
                      Text(
                        "       ",
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white),
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButtonIcon(iconData: Icons.engineering, data: "عامل  "),
                    TextButtonIcon(iconData: Icons.person, data: "زبون  "),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
