import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maintenance_app1/core/utils/shared_preference_store.dart';
import 'package:maintenance_app1/core/widgets/custom_error.dart';
import 'package:maintenance_app1/core/widgets/custom_progress_indicator.dart';
import 'package:maintenance_app1/features/show_qr/presentation/manager/add_request_cubit/add_request_cubit.dart';

class AddRequestForm extends StatefulWidget {
  final XFile image;
  const AddRequestForm({super.key, required this.image});

  @override
  State<AddRequestForm> createState() => _AddRequestFormState();
}

class _AddRequestFormState extends State<AddRequestForm> {
  final _phoneController = TextEditingController();
  final _notesController = TextEditingController();
  final _detailsController = TextEditingController();
  Position? position;
  CameraPosition? kGooglePlex;
  bool _isPermissionRequestInProgress = false;
  // قائمة تحتوي على أيام الأسبوع التي تم اختيارها
  final List<String> _selectedDays = [];
  var key = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneController.dispose();
    _notesController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _determinePosition();
    _requestPermission();
  }

  Future<void> _requestPermission() async {
    if (_isPermissionRequestInProgress) {
      return; // إذا كان هناك طلب قيد التشغيل بالفعل، نتوقف هنا
    }

    setState(() {
      _isPermissionRequestInProgress = true;
    });
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddRequestCubit, AddRequestState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.file(File(widget.image.path),
                          width: 250, height: 250, fit: BoxFit.cover),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text('اختر أيام الأسبوع:'),
                    Material(
                      child: Wrap(
                        spacing: 8.0,
                        children: List.generate(7, (index) {
                          const daysOfWeek = [
                            'الأحد',
                            'الإثنين',
                            'الثلاثاء',
                            'الأربعاء',
                            'الخميس',
                            'الجمعة',
                            'السبت'
                          ];
                          return FilterChip(
                           label: Text(daysOfWeek[index]),
                            selected: _selectedDays.contains(daysOfWeek[index]),
                            onSelected: (bool selected) {
                              setState(() {
                                if (selected) {
                                  _selectedDays.add(daysOfWeek[index]);
                                } else {
                                  _selectedDays.remove(daysOfWeek[index]);
                                }
                              });
                            },
                          );
                        }),
                      ),
                    ),
                    TextField(
                      controller: _phoneController,
                      decoration:
                          const InputDecoration(labelText: 'رقم الموبايل'),
                      keyboardType: TextInputType.phone,
                    ),
                    TextField(
                      controller: _notesController,
                      decoration: const InputDecoration(labelText: 'الملاحظات'),
                    ),
                    TextField(
                      controller: _detailsController,
                      decoration: const InputDecoration(labelText: 'التفاصيل'),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    state is AddRequestLoadingState
                        ? const CustomProgressIndicator()
                        : ElevatedButton(
                            onPressed: () async {
                              if (key.currentState!.validate()) {
                                if (_selectedDays.isNotEmpty &&
                                    position != null) {
                                  await BlocProvider.of<AddRequestCubit>(
                                          context)
                                      .addRequest(
                                    endPoint: 'show_qr',
                                    token: prefs.getString('token')!,
                                    image: widget.image,
                                    check: 1,
                                    days: _selectedDays.join(', '),
                                    number: _phoneController.text,
                                    latitude: position!.latitude,
                                    longitude: position!.longitude,
                                    notes: _notesController.text,
                                    details: _detailsController.text,
                                  );
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              textStyle: const TextStyle(fontSize: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text(
                              'إضافة طلب',
                            ),
                          ),
                    const SizedBox(
                      height: 12,
                    ),
                    if (state is AddRequestSuccessState)
                      Text(
                        state.addRequestModel.message!,
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    else if (state is AddRequestSuccessState)
                      CustomError(message: state.addRequestModel.message!),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
