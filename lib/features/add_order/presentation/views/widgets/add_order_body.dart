import 'package:flutter/material.dart';
import 'package:maintenance_app1/core/widgets/custom_text_button.dart';
import 'package:maintenance_app1/core/widgets/text_button.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/widgets/determine_location.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/widgets/form_section.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/widgets/select_day.dart';

class AddOrderBody extends StatelessWidget {
  AddOrderBody({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _warningsController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _howToUseController = TextEditingController();
  final TextEditingController _warrantyStatusController =
      TextEditingController();
  final TextEditingController _warrantyDurationController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sizeController.dispose();
    _warningsController.dispose();
    _notesController.dispose();
    _howToUseController.dispose();
    _warrantyStatusController.dispose();
    _warrantyDurationController.dispose();
    //  super.dispose();
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
              borderRadius: BorderRadius.circular(2.0), // Apply rounded corners
              border: Border.all(
                color: Colors.grey, // Set the color of the border
                width: 2.0, // Set the thickness of the border
              ),
            ),

            child: SingleChildScrollView(
              child: Form(
                // key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10.0),
                      width: size.width * 0.6,
                      child: const Text(
                        //textDirection: TextDirection.ltr,
                        "طلب صيانة ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 20,
                      thickness: 2,
                      indent: 0,
                      endIndent: 0,
                    ),
                    FormsSection(
                        nameController: _nameController,
                        sizeController: _sizeController,
                        warningsController: _warningsController,
                        notesController: _notesController,
                        howToUseController: _howToUseController,
                        warrantyStatusController: _warrantyStatusController,
                        warrantyDurationController:
                            _warrantyDurationController),
                    SizedBox(
                        width: size.width,
                        height: size.height * 0.15,
                        child: SelectDay()),
                    Center(
                      child: SizedBox(
                        width: size.width * 0.2,
                        height: size.height * 0.1,
                        child: CustomTextButton(
                          backGroundColor: Colors.blue.shade700,
                          //  label: 'موقعي ',
                          icon: const Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DetermineLocation(),
                              ),
                            );
                            // if (keyForm.currentState!.validate()) {
                            //   if (emailValidate()) {
                            //     loginAdmin();
                            //   }
                            // }
                          },
                        ),
                      ),
                    ),
                    // Container(
                    //   padding: EdgeInsets.only(right: 9.0),
                    //   height: size.height * 0.08,
                    //   width: size.width * 0.15,
                    //   child: ElevatedButton(
                    //     onPressed: () async {
                    //       // if (_formKey.currentState!.validate()) {
                    //       //   if (_sizeController is String) {
                    //       //     showCustomAlertDialog(
                    //       //       context,
                    //       //       "!!!",
                    //       //       "the size must be integer",
                    //       //     );
                    //       //   } else {
                    //       //     String token = prefs.getString('token')!;
                    //       //     await BlocProvider.of<AddElectronicDeviceCubit>(
                    //       //             context)
                    //       //         .addNewElectronicDevice(
                    //       //       endPoint: "addelectrical",
                    //       //       token: token,
                    //       //       name: _nameController.text,
                    //       //       size: int.parse(_sizeController.text),
                    //       //       warning: _warningsController.text,
                    //       //       notes: _notesController.text,
                    //       //       wayOfWork: _howToUseController.text,
                    //       //       warranteState: _warrantyStatusController.text,
                    //       //       warantyDate: _warrantyDurationController.text,
                    //       //     );
                    //       //   }
                    //       // }
                    //     },
                    //     style: ElevatedButton.styleFrom(
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(4.0),
                    //       ),
                    //       backgroundColor: Colors.blue,
                    //       // padding: const EdgeInsets.symmetric(
                    //       //     horizontal: 50, vertical: 15),
                    //       textStyle: const TextStyle(fontSize: 18),
                    //     ),
                    //     child: const Text('إضافة الجهاز',
                    //         style: TextStyle(
                    //           color: Colors.white,
                    //         )),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: SizedBox(
                        width: size.width * 0.5,
                        height: size.height * 0.1,
                        child: TextButtonn(
                          label: "إرسال طلب الصيانة",
                          onPressed: () {},
                          backGroundColor: Colors.blue.shade700,
                        ),
                      )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
