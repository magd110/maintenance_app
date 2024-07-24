import 'package:day_picker/day_picker.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_app1/core/widgets/custom_text_button.dart';
import 'package:maintenance_app1/core/widgets/custom_text_form_field.dart';
import 'package:maintenance_app1/core/widgets/text_button.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/widgets/add_image_screen.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/widgets/determine_location.dart';

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
  final List<DayInWeek> _days = [
    DayInWeek(
      "أحد",
      dayKey: "sunday",
    ),
    DayInWeek(
      "إثنين",
      dayKey: "monday",
    ),
    DayInWeek(
      "ثلاثاء",
      dayKey: "tuesday",
    ),
    DayInWeek(
      "أربعاء",
      dayKey: "wednesday",
    ),
    DayInWeek(
      "خميس",
      dayKey: "thursday",
    ),
    DayInWeek(
      "جمعة",
      dayKey: "friday",
      isSelected: false,
    ),
    DayInWeek(
      "سبت",
      dayKey: "saturday",
      isSelected: false,
    ),
  ];

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
                Padding(
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
                      SizedBox(
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
                ),
                SizedBox(
                    width: size.width,
                    height: size.height * 0.15,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('اختر اليوم المناسب لك:'),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: SelectWeekDays(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  days: _days,
                                  boxDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      // 10% of the width, so there are ten blinds.
                                      colors: [
                                        Colors.blue.shade300,
                                        Colors.blue.shade700,
                                      ], // whitish to gray
                                      tileMode: TileMode
                                          .repeated, // repeats the gradient over the canvas
                                    ),
                                  ),
                                  onSelect: (values) {
                                    print(values);
                                  },
                                ),
                              ),
                            ),
                          ]),
                    )),
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
