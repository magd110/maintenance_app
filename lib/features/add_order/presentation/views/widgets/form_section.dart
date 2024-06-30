import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:maintenance_app1/core/widgets/custom_text_form_field.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/widgets/add_image_screen.dart';

class FormsSection extends StatelessWidget {
  const FormsSection({
    super.key,
    required TextEditingController nameController,
    required TextEditingController sizeController,
    required TextEditingController warningsController,
    required TextEditingController notesController,
    required TextEditingController howToUseController,
    required TextEditingController warrantyStatusController,
    required TextEditingController warrantyDurationController,
  })  : _nameController = nameController,
        _sizeController = sizeController,
        _warningsController = warningsController,
        _notesController = notesController,
        _howToUseController = howToUseController,
        _warrantyStatusController = warrantyStatusController,
        _warrantyDurationController = warrantyDurationController;

  final TextEditingController _nameController;
  final TextEditingController _sizeController;
  final TextEditingController _warningsController;
  final TextEditingController _notesController;
  final TextEditingController _howToUseController;
  final TextEditingController _warrantyStatusController;
  final TextEditingController _warrantyDurationController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormFiled(
            sizee: 0.8,
            controller: _nameController,
            label: 'رقم الهاتف',
            option: false,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              width: size.width,
              height: size.height * 0.25,
              child: const AddImageScreen()),
          const SizedBox(height: 10),
          CustomTextFormFiled(
            sizee: 0.5,
            controller: _sizeController,
            label: 'تقاصيل الطلب ',
          ),

          const SizedBox(height: 10),
          CustomTextFormFiled(
            sizee: 0.7,
            controller: _notesController,
            label: 'ملاحظات',
          ),
          // const SizedBox(height: 10),
          // CustomTextFormFiled(
          //   sizee: 0.7,
          //   controller: _howToUseController,
          //   label: 'طريقة العمل',
          // ),
        ],
      ),
    );
  }
}
