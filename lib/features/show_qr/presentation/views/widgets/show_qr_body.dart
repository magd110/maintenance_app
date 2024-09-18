import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maintenance_app1/core/utils/service_locator.dart';
import 'package:maintenance_app1/core/utils/shared_preference_store.dart';
import 'package:maintenance_app1/core/widgets/custom_progress_indicator.dart';
import 'package:maintenance_app1/features/show_qr/data/repos/add_request_repo/add_request_repo_impl.dart';
import 'package:maintenance_app1/features/show_qr/presentation/manager/add_request_cubit/add_request_cubit.dart';
import 'package:maintenance_app1/features/show_qr/presentation/manager/request_inquiry_cubit/request_inquiry_cubit.dart';
import 'package:maintenance_app1/features/show_qr/presentation/views/widgets/add_request_form.dart';
import 'package:maintenance_app1/features/show_qr/presentation/views/widgets/show_list_of_requests.dart';

class ShowQrBody extends StatefulWidget {
  const ShowQrBody({super.key});

  @override
  State<ShowQrBody> createState() => _ShowQrBodyState();
}

class _ShowQrBodyState extends State<ShowQrBody> {
  XFile? _qrImage;
  final ImagePicker _picker = ImagePicker();

  void _pickQrImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _qrImage = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الصفحة الرئيسية'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _pickQrImage,
                  child: _qrImage == null
                      ? Container(
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(15.0),
                            border:
                                Border.all(color: Colors.blueAccent, width: 2),
                          ),
                          child: const Center(
                            child: Icon(Icons.qr_code,
                                size: 100, color: Colors.blueAccent),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.file(File(_qrImage!.path),
                              width: 250, height: 250, fit: BoxFit.cover),
                        ),
                ),
                const SizedBox(height: 30),
                BlocBuilder<RequestInquiryCubit, RequestInquiryState>(
                  builder: (context, state) {
                    if (state is RequestInquiryLoadingState) {
                      return const CustomProgressIndicator();
                    }

                    if (state is RequestInquirySuccessState) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ShowListOfRequests(
                                data: state.requestInquiryModel),
                          ),
                        );
                      });
                    }

                    return ElevatedButton.icon(
                      onPressed: () async {
                        if (_qrImage != null) {
                          await BlocProvider.of<RequestInquiryCubit>(context)
                              .requestInquiry(
                            endPoint: 'show_qr',
                            token: prefs.getString('token')!,
                            image: _qrImage!,
                            check: 0,
                          );
                        }
                      },
                      icon: const Icon(Icons.search),
                      label: const Text('استعلام عن طلب'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        textStyle: const TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_qrImage != null) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => AddRequestCubit(
                                getIt.get<AddRequestRepoImpl>(),
                              ),
                              child: AddRequestForm(
                                image: _qrImage!,
                              ),
                            ),
                          ),
                        );
                      });
                    }
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('إضافة طلب'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
