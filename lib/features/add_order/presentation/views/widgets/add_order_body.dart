import 'package:day_picker/day_picker.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_app1/core/widgets/custom_text_button.dart';
import 'package:maintenance_app1/core/widgets/custom_text_form_field.dart';
import 'package:maintenance_app1/core/widgets/text_button.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/widgets/add_image_screen.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/widgets/determine_location.dart';

class AddOrderBody extends StatefulWidget {
  const AddOrderBody({super.key});

  @override
  State<AddOrderBody> createState() => _AddOrderBodyState();
}

class _AddOrderBodyState extends State<AddOrderBody> {
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
      super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(4.0),
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
                  padding: const EdgeInsets.all(10.0),
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
                       
                      },
                    ),
                  ),
                ),
                
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
