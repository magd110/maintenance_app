import 'dart:typed_data';
import 'package:day_picker/day_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maintenance_app1/core/utils/shared_preference_store.dart';
import 'package:maintenance_app1/core/widgets/custom_progress_indicator.dart';
import 'package:maintenance_app1/core/widgets/custom_text_button.dart';
import 'package:maintenance_app1/core/widgets/custom_text_form_field.dart';
import 'package:maintenance_app1/core/widgets/text_button.dart';
import 'package:maintenance_app1/features/add_order/presentation/manager/store_request_by_user_cubit/store_request_by_user_cubit.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/widgets/determine_location.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/widgets/header_clipper.dart';

class AddOrderBodyState extends StatefulWidget {
  final int id;
  const AddOrderBodyState({super.key, required this.id});

  @override
  State<AddOrderBodyState> createState() => _AddOrderBodyState();
}

class _AddOrderBodyState extends State<AddOrderBodyState> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController daysController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  bool _isPermissionRequestInProgress = false;
  String? myToken;
  XFile? image;
  Uint8List? imageBytes;
  Position? position;
  CameraPosition? kGooglePlex;

  @override
  void initState() {
    super.initState();
    _determinePosition();
    _requestPermission();
  }

  Future<void> _determinePosition() async {
    try {
      position = await Geolocator.getCurrentPosition();
      kGooglePlex = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude),
        zoom: 14.4746,
      );
      setState(() {});
      print(
          "-------------------------${position!.latitude}-----------------${position!.longitude}");
    } catch (e) {
      print("Error obtaining location: $e");
    }
  }

  Future<void> _pickImage() async {
    try {
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
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  Future<void> _requestPermission() async {
    if (_isPermissionRequestInProgress) {
      return; // إذا كان هناك طلب قيد التشغيل بالفعل، نتوقف هنا
    }

    setState(() {
      _isPermissionRequestInProgress = true;
    });

    try {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        print("User granted permission");
      } else {
        print("User declined or has not accepted permission");
      }

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print(
            "title: ${message.notification?.title}|body:${message.notification?.body}");
      });

      myToken = await FirebaseMessaging.instance.getToken();
      print("MyToken: $myToken");
    } catch (e) {
      print("Error requesting permissions: $e");
    } finally {
      setState(() {
        _isPermissionRequestInProgress = false; // نحدد أن الطلب انتهى
      });
    }
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    detailsController.dispose();
    notesController.dispose();
    daysController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<StoreRequestByUserCubit, StoreRequestByUserState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: size.height * 0.15,
                child: ClipPath(
                  clipper: HeaderClipper(),
                  child: Container(
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
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextFormFiled(
                                    sizee: 0.4,
                                    controller: phoneNumberController,
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
                                    child: CustomTextButton(
                                      icon: Icon(
                                        size: size.width * 0.15,
                                        Icons.location_on_outlined,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const DetermineLocation(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: size.width,
                                height: size.height * 0.2,
                                child: Row(
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
                                        ),
                                      ),
                                    ),
                                    imageBytes == null
                                        ? const Text(
                                            "No Image Selected",
                                            style:
                                                TextStyle(color: Colors.black),
                                          )
                                        : Padding(
                                            padding: EdgeInsets.only(
                                                right: size.width * 0.06),
                                            child: SizedBox(
                                              width: size.width * 0.4,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                      ),
                                                    ),
                                                    child: Image.memory(
                                                      imageBytes!,
                                                      fit: BoxFit.fill,
                                                      height:
                                                          size.height * 0.25,
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
                                controller: detailsController,
                                label: 'تفاصيل الطلب',
                              ),
                              const SizedBox(height: 10),
                              CustomTextFormFiled(
                                sizee: 0.7,
                                controller: notesController,
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
                                          colors: [
                                            Colors.blue.shade300,
                                            Colors.blue.shade700,
                                          ],
                                          tileMode: TileMode.repeated,
                                        ),
                                      ),
                                      onSelect: (values) {
                                        daysController.text = values.toString();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        state is StoreRequestByUserLoadingState
                            ? const CustomProgressIndicator()
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: SizedBox(
                                    width: size.width * 0.5,
                                    height: size.height * 0.1,
                                    child: TextButtonn(
                                      label: "إرسال طلب الصيانة",
                                      onPressed: () async {
                                       
                                        if (position != null &&
                                            daysController.text.isNotEmpty &&
                                            phoneNumberController
                                                .text.isNotEmpty &&
                                            notesController.text.isNotEmpty &&
                                            detailsController.text.isNotEmpty &&
                                            image != null) {
                                          BlocProvider.of<StoreRequestByUserCubit>(
                                                  context)
                                              .storeRequest(
                                                  image: image!,
                                                  latitude: position!.latitude,
                                                  longitude:
                                                      position!.longitude,
                                                  phoneNumber:
                                                      phoneNumberController
                                                          .text,
                                                  details:
                                                      detailsController.text,
                                                  notes: notesController.text,
                                                  days: daysController.text,
                                                  id: widget.id,
                                                  endPoint:
                                                      'storeRequestByUser',
                                                  token: prefs
                                                      .getString('token')!);
                                        }
                                      },
                                      backGroundColor: Colors.blue.shade700,
                                    ),
                                  ),
                                ),
                              ),
                        const SizedBox(
                          height: 5,
                        ),
                        if (state is StoreRequestByUserSuccessState)
                          Center(
                            child: Text(
                              state.storeRequestByUserModel.message!,
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        if (state is StoreRequestByUserFailureState)
                          Center(
                              child: Text(
                            state.errorMessage,
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
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
}
