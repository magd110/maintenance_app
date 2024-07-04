import 'package:flutter/material.dart';

import 'widgets/show_electrical_body.dart';

class ShowElectrical extends StatelessWidget {
  const ShowElectrical({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: const ShowElectricalBody(),
        backgroundColor: Colors.white,
      ),
    );
  }
}
