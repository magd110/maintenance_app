import 'package:flutter/material.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/widgets/add_order_body.dart';

class AddOrder extends StatelessWidget {
  final int id;
  const AddOrder({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: AddOrderBodyState(id: id,),
    );
  }
}
