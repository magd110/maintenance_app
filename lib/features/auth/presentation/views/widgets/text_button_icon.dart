import 'package:flutter/material.dart';
import 'package:maintenance_app1/features/auht_worker/presentation/views/login_for_worker.dart';
import 'package:maintenance_app1/features/auth/presentation/views/login_page.dart';

class TextButtonIcon extends StatelessWidget {
  const TextButtonIcon({super.key, required this.iconData, required this.data});
  final IconData iconData;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.white, // اللون المحدد هنا
          width: 2.0, // عرض الحدود
        ),
      ),
      child: TextButton.icon(
          icon: Icon(
            iconData,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            if (data == "زبون  ") {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            } else {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const LoginForWorkerPage(),
                ),
              );
            }
          },
          label: Text(
            data,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          )),
    );
  }
}
