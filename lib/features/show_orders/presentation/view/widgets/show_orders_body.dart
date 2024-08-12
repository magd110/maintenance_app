import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:maintenance_app1/core/utils/service_locator.dart';
import 'package:maintenance_app1/core/widgets/custom_error.dart';
import 'package:maintenance_app1/core/widgets/custom_progress_indicator.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/widgets/header_clipper.dart';
import 'package:maintenance_app1/features/processes_orders/data/repos/update_request_by_worker_repo_impl.dart';
import 'package:maintenance_app1/features/processes_orders/presentation/manager/cubit/update_request_by_worker_cubit.dart';
import 'package:maintenance_app1/features/processes_orders/presentation/views/processes_orders.dart';
import 'package:maintenance_app1/features/show_orders/presentation/manager/cubit/show_order_cubit.dart';

class ShowOrdersBody extends StatefulWidget {
  const ShowOrdersBody({super.key});

  @override
  State<ShowOrdersBody> createState() => _ShowOrdersBodyState();
}

class _ShowOrdersBodyState extends State<ShowOrdersBody> {
  Future<String> getReverseGeocoding(String latitude, String longitude) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=$latitude&lon=$longitude');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final displayName = data['display_name'] as String;
      final addressParts = displayName.split(', ');
      String name = addressParts[0];
      String suburb = addressParts[1];
      String street = addressParts[2];
      print("+++++++++++++++");
      print('$name, $suburb, $street');
      print("+++++++++++++++");
      return '$name, $suburb, $street';
    } else {
      throw Exception('Failed to fetch address');
    }
  }

  @override
  @override
  void initState() {
    // TODO: implement initState
    getReverseGeocoding('33.5167', '36.3167');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<ShowOrderCubit, ShowOrderState>(
          builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.2,
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
                // child: Column(
                //   children: [
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                FontAwesomeIcons.wrench, // أيقونة الصيانة
                size: 24.0,
                color: Colors.blue,
              ),
            ),
            state is ShowOrderSuccessState
                ? Expanded(
                    child: ListView.builder(
                      itemCount:
                          state.showOrdersModel.maintenanceRequests!.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => UpdateRequestByWorkerCubit(
                                  getIt.get<UpdateRequestByWorkerRepoImpl>()),
                              child: ProcessesOrders(
                                id: state.showOrdersModel
                                    .maintenanceRequests![index].id!,
                              ),
                            ),
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width:
                                size.width, // Set the desired width of the box
                            height: size.height *
                                0.2, // Set the desired height of the box
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 4.0),
                                      child: Text(
                                        state
                                            .showOrdersModel
                                            .maintenanceRequests![index]
                                            .startTime
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w300,
                                          // fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      state.showOrdersModel
                                          .maintenanceRequests![index].endTime
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w300,
                                        // fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          const Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.blue,
                                          ),
                                          FutureBuilder(
                                            future: getReverseGeocoding(
                                                state
                                                    .showOrdersModel
                                                    .maintenanceRequests![index]
                                                    .latitude!,
                                                state
                                                    .showOrdersModel
                                                    .maintenanceRequests![index]
                                                    .longitude!),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return const Text(
                                                  'Loading...',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                );
                                              } else if (snapshot.hasError) {
                                                return Text(
                                                  'Error: ${snapshot.error}',
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                );
                                              } else {
                                                return Text(
                                                  '${snapshot.data}',
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                );
                                              }
                                            },
                                          )
                                        ],
                                      ),
                                      Container(
                                        color: Colors.blue,
                                        width: 2.0, // تحديد العرض المطلوب
                                        height: 50.0, // تحديد الارتفاع المطلوب
                                      ),
                                      Column(
                                        children: [
                                          const Icon(
                                            Icons.phone_android_outlined,
                                            color: Colors.blue,
                                          ),
                                          Text(
                                            state
                                                .showOrdersModel
                                                .maintenanceRequests![index]
                                                .number!,
                                            style: const TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              // fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : const CustomProgressIndicator(),
            if (state is ShowOrderFailureState)
              CustomError(message: state.errorMessage)
          ],
        );
      }),
    );
  }
}
