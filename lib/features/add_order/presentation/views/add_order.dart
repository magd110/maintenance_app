import 'package:flutter/material.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/widgets/add_order_body.dart';

class AddOrder extends StatelessWidget {
  const AddOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AddOrderBody(),
    );
  }
}
