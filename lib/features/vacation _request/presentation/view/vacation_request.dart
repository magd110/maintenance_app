import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_app1/features/vacation%20_request/presentation/view/widgets/vacation_request_body.dart';

class VacationRequest extends StatelessWidget {
  const VacationRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      child: VacationRequestBody(),
      textDirection: TextDirection.rtl,
    );
  }
}
