import 'dart:typed_data';

import 'package:day_picker/day_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maintenance_app1/core/widgets/custom_text_button.dart';
import 'package:maintenance_app1/core/widgets/custom_text_form_field.dart';
import 'package:maintenance_app1/core/widgets/text_button.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/widgets/determine_location.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/widgets/header_clipper.dart';

class AddOrderBodyState extends StatefulWidget {
  @override
  _AddOrderBodyState createState() => _AddOrderBodyState();
}

class _AddOrderBodyState extends State<AddOrderBodyState> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _warningsController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _howToUseController = TextEditingController();
  final TextEditingController _warrantyStatusController =
      TextEditingController();
  final TextEditingController _warrantyDurationController =
      TextEditingController();
  String? myToken;
  XFile? image;
  Uint8List? imageBytes;
  Position? position;
  late final CameraPosition _kGooglePlex;
  Future<Position?> getCurrentLocationApp() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print(" الرجاء ");
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('الرجاء تشغيل خدمة الموقع على جهازك');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    if (permission == LocationPermission.whileInUse) {
      _kGooglePlex = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude),
        zoom: 14.4746,
      );
      print("==============================");

      print(position!.latitude);
      print(position!.longitude);
      print("==============================");
    }
    return position;
  }

  Future<void> _determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    position = await Geolocator.getCurrentPosition();
    _kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    print("==============================");

    print(position!.latitude);
    print(position!.longitude);
    print("==============================");
    setState(() {});
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? selectedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      final Uint8List bytes = await selectedImage.readAsBytes();
      setState(() {
        image = selectedImage;
        imageBytes = bytes;
      });
    }
  }

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
  void requesPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      sound: true,
      announcement: false,
      provisional: false,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User Granted permission");
      //المستخدم اعطى صلاحية
    }
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(
          "title: ${message.notification?.title}|body:${message.notification?.body}");
    });
    FirebaseMessaging.instance.getToken().then((token) {
      print("MyToken:${token}");
      myToken = token;
    });
  }

  @override
  void initState() {
    _determinePosition();
    requesPermission();
    // getCurrentLocationApp();
    super.initState();
  }

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

        child: Column(
          children: [
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
                // key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextFormFiled(
                                sizee: 0.4,
                                controller: _nameController,
                                label: 'رقم الهاتف',
                                option: false,
                                keyboardType: TextInputType.phone,
                              ),
                              Container(
                                color: Colors.blue,
                                width: 2,
                                height: size.height * 0.08,
                              ),
                              SizedBox(
                                width: size.width * 0.4,
                                // height: size.height * 0.2,
                                child: CustomTextButton(
                                  // backGroundColor: Colors.blue.shade700,
                                  //  label: 'موقعي ',
                                  icon: Icon(
                                    size: size.width * 0.15,
                                    Icons.location_on_outlined,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetermineLocation(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: size.width,
                            height: size.height * 0.2,
                            child: Row(
                              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: _pickImage,
                                  child: Center(
                                      child: DottedBorder(
                                    color: Colors.blue,
                                    strokeWidth: 2,
                                    child: Container(
                                      width: size.width * 0.4,
                                      height: size.height * 0.25,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                      ),
                                      child: const Icon(
                                        Icons.camera_alt,
                                        color: Colors.blue,
                                        size: 50.0,
                                      ),
                                    ),
                                  )),
                                ),
                                imageBytes == null
                                    ? const Text(
                                        "No Image Selected",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : Padding(
                                        padding: EdgeInsets.only(
                                            right: size.width * 0.06),
                                        child: SizedBox(
                                          width: size.width * 0.4,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                color: Colors.blue,
                                                width: 2,
                                                height: size.height * 0.08,
                                              ),
                                              Container(
                                                width: size.width * 0.25,
                                                height: size.height * 0.4,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[100],
                                                  border: Border.all(
                                                    color: Colors.blue,
                                                    width: 2.0,
                                                    style: BorderStyle.solid,
                                                  ),
                                                ),
                                                child: Image.memory(
                                                  imageBytes!,
                                                  fit: BoxFit.fill,
                                                  height: size.height * 0.25,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
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
                                        borderRadius:
                                            BorderRadius.circular(30.0),
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
                                        print(image!.path);
                                        print(imageBytes);
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: SizedBox(
                        width: size.width * 0.5,
                        height: size.height * 0.1,
                        child: TextButtonn(
                          label: "إرسال طلب الصيانة",
                          onPressed: () {
                            print(position!.latitude);
                            print(position!.longitude);
                            print(myToken);
                          },
                          backGroundColor: Colors.blue.shade700,
                        ),
                      )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
