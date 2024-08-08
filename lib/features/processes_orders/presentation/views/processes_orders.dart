import 'package:flutter/material.dart';

import 'widgets/processes_orders_body.dart';

class ProcessesOrders extends StatelessWidget {
  const ProcessesOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return  Directionality(child: ProcessesOrdersBody(),textDirection: TextDirection.rtl,);
  }
}