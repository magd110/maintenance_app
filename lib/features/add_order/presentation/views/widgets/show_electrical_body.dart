import 'package:flutter/material.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/add_order.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/widgets/build_electrical_grid.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/widgets/header_clipper.dart';

class ShowElectricalBody extends StatelessWidget {
  const ShowElectricalBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: size.width,
        height: size.height * 0.2,
        child: ClipPath(
          clipper: HeaderClipper(),
          child: Container(
            child: Center(
              child: Text(
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
            height: size.height,
            width: size.width,
            color: Colors.blue,
          ),
          // child: Column(
          //   children: [
        ),
      ),
      Text("اختر الآلة التي تريد تقديم طلب صيانة لها "),
      InkWell(
        child: BuildElectricalGrid(),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddOrder(),
            ),
          );
        },
      ),
    ]);
  }
}
