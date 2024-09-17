import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance_app1/core/utils/shared_preference_store.dart';
import 'package:maintenance_app1/core/widgets/custom_progress_indicator.dart';
import 'package:maintenance_app1/core/widgets/custom_text_form_field.dart';
import 'package:maintenance_app1/core/widgets/text_button.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/widgets/header_clipper.dart';
import 'package:maintenance_app1/features/vacation%20_request/presentation/manager/cubit/request_leave_cubit.dart';

class VacationRequestBody extends StatefulWidget {
  const VacationRequestBody({super.key});

  @override
  State<VacationRequestBody> createState() => _VacationRequestBodyState();
}

class _VacationRequestBodyState extends State<VacationRequestBody> {
  final TextEditingController reasonController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    reasonController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<RequestLeaveCubit, RequestLeaveState>(
        builder: (context, state) {
          return Container(
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
                            label: 'قم بتوضيح سبب طلب الإجازة',
                          ),
                        ),
                      ),
                      state is RequestLeaveLoadingState
                          ? const CustomProgressIndicator()
                          : Padding(
                              padding: EdgeInsets.only(top: size.height * 0.05),
                              child: Center(
                                child: SizedBox(
                                  width: size.width * 0.5,
                                  height: size.height * 0.1,
                                  child: TextButtonn(
                                    label: "إرسال طلب الإجازة",
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        await BlocProvider.of<
                                                RequestLeaveCubit>(context)
                                            .requstLeave(
                                          token: prefs.getString('token_worker')!,
                                          endPoint: 'requestleave',
                                          reason: reasonController.text, idapplication: '',
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
                      if (state is RequestLeaveSuccessState)
                        Center(
                          child: Text(
                            state.requestLeaveModel.message!,
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      if (state is RequestLeaveFailureState)
                        Center(
                          child: Text(
                            state.errorMessage,
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ]));
        },
      ),
    );
  }
}
