import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_app1/core/widgets/custom_text_form_field.dart';
import 'package:maintenance_app1/core/widgets/text_button.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/widgets/header_clipper.dart';

class InformationWorkerBody extends StatefulWidget {
  const InformationWorkerBody({super.key});

  @override
  State<InformationWorkerBody> createState() => _InformationWorkerBodyState();
}

class _InformationWorkerBodyState extends State<InformationWorkerBody> {
  final TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              color: Colors.white, // Set the background color
            ),
            child: Column(children: [
              SizedBox(
                width: size.width,
                height: size.height * 0.2,
                child: ClipPath(
                  clipper: HeaderClipper(),
                  child: Container(
                    height: size.height,
                    width: size.width,
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Maintenance',
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          color: Colors.blue[800],
                          shadows: [
                            Shadow(
                              offset: const Offset(2.0, 2.0),
                              blurRadius: 3.0,
                              color: Colors.grey[500]!,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0, top: 20),
                      child: Center(
                        child: CustomTextFormFiled(
                          sizee: 0.8,
                          controller: passwordController,
                          label: 'قم بادخال كلمة المرور الجديدة  ',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.05),
                      child: Center(
                        child: SizedBox(
                          width: size.width * 0.5,
                          height: size.height * 0.1,
                          child: TextButtonn(
                            label: "تحديث كلمة المرور",
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {}
                            },
                            backGroundColor: Colors.blue.shade700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ])));
  }
}
