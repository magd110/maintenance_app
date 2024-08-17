import 'package:flutter/material.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/widgets/header_clipper.dart';
import 'package:maintenance_app1/features/information_worker/presentation/views/information_worker_page.dart';
import 'package:maintenance_app1/features/resignation_request/presentation/views/resignation_request_page.dart';
import 'package:maintenance_app1/features/vacation%20_request/presentation/view/vacation_request.dart';

class MorePageForWorker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Column(children: [
      SizedBox(
        height: size.height * 0.15,
        child: ClipPath(
          clipper: HeaderClipper(),
          child: Container(
            color: Colors.blue,
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
                      offset: const Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: Colors.grey[500]!,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const VacationRequest()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'طلب اجازة',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const ResignationRequestPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'طلب استقالة',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const InformationWorkerPage()),
                );
                // قم بتنفيذ الإجراء عند الضغط على زر تعديل كلمة المرور
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'تعديل كلمة المرور',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ]));
  }
}
