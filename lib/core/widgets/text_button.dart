import 'package:flutter/material.dart';

class TextButtonn extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle textStyle;
  final Color backGroundColor;

  const TextButtonn({
    super.key,
    required this.label,
    required this.onPressed,
    this.textStyle = const TextStyle(),
    this.backGroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backGroundColor,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      // mainAxisAlignment: MainAxisAlignment.start,
      //  crossAxisAlignment: CrossAxisAlignment.start,

      // Use the icon! to unwrap the nullable value

      // Center(
      //   child: Text(
      //     label,
      //     style: textStyle,
      //   ),
      // ),
    );
  }
}
