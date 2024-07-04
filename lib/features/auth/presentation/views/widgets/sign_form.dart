import 'package:flutter/material.dart';

import 'form_section.dart';

class SignForm extends StatefulWidget {
  const SignForm({
    super.key,
  });

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        //const TextSection(),

        FormSection(),
      ],
    );
  }
}
