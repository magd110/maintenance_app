import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({super.key, required this.data});
  final String data;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: QrImageView(
            data: data,
            version: QrVersions.auto,
            size: 500,
            // backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
