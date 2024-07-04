import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  final String message;
  const CustomError({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    );
  }
}
