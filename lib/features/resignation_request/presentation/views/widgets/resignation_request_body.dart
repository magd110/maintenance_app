import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance_app1/core/utils/shared_preference_store.dart';
import 'package:maintenance_app1/core/widgets/custom_error.dart';
import 'package:maintenance_app1/core/widgets/custom_progress_indicator.dart';
import 'package:maintenance_app1/core/widgets/custom_text_form_field.dart';
import 'package:maintenance_app1/core/widgets/text_button.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/widgets/header_clipper.dart';
import 'package:maintenance_app1/features/resignation_request/presentation/manager/cubit/resignation_cubit.dart';

class ResignationRequestBody extends StatefulWidget {
  const ResignationRequestBody({super.key});

  @override
  State<ResignationRequestBody> createState() => _ResignationRequestBodyState();
}

class _ResignationRequestBodyState extends State<ResignationRequestBody> {
  final TextEditingController reasonController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool _isPermissionRequestInProgress = false;
    String? myToken;


  @override
  void dispose() {
    reasonController.dispose();

    super.dispose();
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
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ResignationCubit, ResignationState>(
      builder: (context, state) {
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
                              controller: reasonController,
                              label: 'قم بتوضيح سبب طلب الاستقالة ',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.05),
                          child: Center(
                            child: SizedBox(
                              width: size.width * 0.5,
                              height: size.height * 0.1,
                              child: state is ResignationLoadingState ? const CustomProgressIndicator() : TextButtonn(
                                label: "إرسال طلب الاستقالة ",
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                   await BlocProvider.of<ResignationCubit>(context)
                                        .resignationRequest(
                                      endPoint: 'exitworker',
                                      token: prefs.getString('token_worker')!,
                                      reason: reasonController.text,
                                    );
                                  }
                                },
                                backGroundColor: Colors.blue.shade700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        if(state is ResignationSuccessState)
                        Center(child: Text(state.resignationModel.message!,style: const TextStyle(color: Colors.green,fontWeight: FontWeight.bold,),))
                        else if(state is ResignationFailureState)
                        Center(child: CustomError(message: state.errorMessage))
                      ],
                    ),
                  ),
                ])));
      },
    );
  }
}
