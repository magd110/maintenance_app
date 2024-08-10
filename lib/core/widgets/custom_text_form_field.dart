import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    required this.controller,
    required this.label,
    this.sizee,
    this.option,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String label;
  final double? sizee;
  final bool? option;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * sizee!,
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2.0),
              //borderRadius: BorderRadius.circular(8.0),
            ),
            filled: true,
            fillColor: Colors.white),
        validator: (value) {
          if (value!.isEmpty) {
            return 'يرجى إدخال $label';
          }
        },
      ),
    );
  }
}
