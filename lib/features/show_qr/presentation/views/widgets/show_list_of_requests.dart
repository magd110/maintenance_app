import 'package:flutter/material.dart';
import 'package:maintenance_app1/features/show_qr/data/models/request_inquiry_model/request_inquiry_model.dart';

class ShowListOfRequests extends StatelessWidget {
  final List<RequestInquiryModel> data;
  const ShowListOfRequests({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              child: ListTile(
                title: Text('الطلب رقم: ${data[index].id}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('حالة الكفالة: ${data[index].warrantyState}'),
                    Text('السعر: ${data[index].salary}'),
                    Text('تاريخ البدء: ${data[index].startTime}'),
                    Text('تاريخ الانتهاء: ${data[index].endTime}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
