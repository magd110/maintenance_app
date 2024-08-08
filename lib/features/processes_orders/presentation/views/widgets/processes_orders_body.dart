import 'package:flutter/material.dart';
import 'package:maintenance_app1/core/widgets/custom_text_form_field.dart';
import 'package:maintenance_app1/core/widgets/text_button.dart';

import '../../../../add_order/presentation/views/widgets/header_clipper.dart';

class ProcessesOrdersBody extends StatelessWidget {
  ProcessesOrdersBody({super.key});
  final TextEditingController consumablePartsController =
      TextEditingController();
  final TextEditingController repairsController = TextEditingController();
  final TextEditingController requestStateController = TextEditingController();
  @override
  void dispose() {
    consumablePartsController.dispose();
    repairsController.dispose();
    requestStateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(4.0),
            child: Container(
                width: size.width, // Set the desired width of the box
                height: size.height * 1, // Set the desired height of the box
                decoration: BoxDecoration(
                  color: Colors.white, // Set the background color
                  borderRadius:
                      BorderRadius.circular(2.0), // Apply rounded corners
                  border: Border.all(
                    color: Colors.grey, // Set the color of the border
                    width: 2.0, // Set the thickness of the border
                  ),
                ),
                child: Column(children: [
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.15,
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
                  SingleChildScrollView(
                    child: Form(
                      //key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextFormFiled(
                                  sizee: 0.8,
                                  controller: consumablePartsController,
                                  label: 'القطع المستهلكة',
                                  keyboardType: TextInputType.phone,
                                ),
                                const SizedBox(height: 10),
                                CustomTextFormFiled(
                                  sizee: 0.8,
                                  controller: repairsController,
                                  label: 'الإصلاحات ',
                                ),
                                const SizedBox(height: 10),
                                CustomTextFormFiled(
                                  sizee: 0.4,
                                  controller: requestStateController,
                                  label: 'حالة الطلب ',
                                  option: true,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.4),
                            child: Center(
                                child: SizedBox(
                              width: size.width * 0.5,
                              height: size.height * 0.1,
                              child: TextButtonn(
                                label: "إنهاء طلب الصيانة",
                                onPressed: () {},
                                backGroundColor: Colors.blue.shade700,
                              ),
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                ]))));
  }
}
