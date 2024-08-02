import 'package:flutter/material.dart';
import 'package:maintenance_app1/features/show_orders/presentation/view/widgets/show_orders_body.dart';

class ShowOrdresPage extends StatelessWidget {
  const ShowOrdresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Directionality(textDirection: TextDirection.rtl,
    child: ShowOrdersBody());
  }
}