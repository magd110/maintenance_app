import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance_app1/core/utils/shared_preference_store.dart';
import 'package:maintenance_app1/core/widgets/custom_progress_indicator.dart';
import 'package:maintenance_app1/core/widgets/custom_text_form_field.dart';
import 'package:maintenance_app1/core/widgets/text_button.dart';
import 'package:maintenance_app1/features/processes_orders/presentation/manager/cubit/update_request_by_worker_cubit.dart';

import '../../../../add_order/presentation/views/widgets/header_clipper.dart';

class ProcessesOrdersBody extends StatefulWidget {
  final int id;
  const ProcessesOrdersBody({super.key, required this.id});

  @override
  State<ProcessesOrdersBody> createState() => _ProcessesOrdersBodyState();
}

class _ProcessesOrdersBodyState extends State<ProcessesOrdersBody> {
  final TextEditingController consumablePartsController =
      TextEditingController();

  final TextEditingController repairsController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    consumablePartsController.dispose();
    repairsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(body:
        BlocBuilder<UpdateRequestByWorkerCubit, UpdateRequestByWorkerState>(
      builder: (context, state) {
        return Container(
            decoration: const BoxDecoration(
              color: Colors.white, // Set the background color
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
                  key: formKey,
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
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.4),
                        child: Center(
                            child: SizedBox(
                          width: size.width * 0.5,
                          height: size.height * 0.1,
                          child: state is UpdateRequestByWorkerLoadingState
                              ? const CustomProgressIndicator()
                              : TextButtonn(
                                  label: "إنهاء طلب الصيانة",
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      await BlocProvider.of<
                                                  UpdateRequestByWorkerCubit>(
                                              context)
                                          .updateRequest(
                                        endPoint: 'updateRequestByWorker',
                                        token: prefs.getString('token_worker')!,
                                        consumableParts:
                                            consumablePartsController.text,
                                        repairs: repairsController.text,
                                        id: widget.id,
                                      );
                                    }
                                  },
                                  backGroundColor: Colors.blue.shade700,
                                ),
                        )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (state is UpdateRequestByWorkerSuccessState)
                        Center(
                          child: Text(
                            state.updateRequestByWorkerModel.message!,
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      else if (state is UpdateRequestByWorkerFailureState)
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
              ),
            ]));
      },
    ));
  }
}
