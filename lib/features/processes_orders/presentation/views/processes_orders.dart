import 'package:flutter/material.dart';

import 'widgets/processes_orders_body.dart';

class ProcessesOrders extends StatelessWidget {
  final int id;
  const ProcessesOrders({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: ProcessesOrdersBody(id: id,),
    );
  }
}
