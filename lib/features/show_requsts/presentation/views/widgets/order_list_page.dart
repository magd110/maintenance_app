import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:maintenance_app1/core/utils/service_locator.dart';
import 'package:maintenance_app1/core/widgets/custom_error.dart';
import 'package:maintenance_app1/core/widgets/custom_progress_indicator.dart';
import 'package:maintenance_app1/features/show_requsts/data/repos/rating_team_repo/rating_team_repo_impl.dart';
import 'package:maintenance_app1/features/show_requsts/presentation/manager/rating_cubit/rating_cubit.dart';
import 'package:maintenance_app1/features/show_requsts/presentation/manager/show_requests_cubit/show_requsts_cubit.dart';
import 'package:maintenance_app1/features/show_requsts/presentation/views/widgets/rating_team.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowRequstsCubit, ShowRequstsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text("Order List")),
          body: state is ShowRequstsSuccessState
              ? ListView.builder(
                  itemCount: state.requsts.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (state.requsts[index].requestState == 'Complete') {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) =>
                                  RatingCubit(getIt.get<RatingTeamRepoImpl>()),
                              child: RatingTeam(
                                id: state.requsts[index].teamId!,
                              ),
                            ),
                          ));
                        }
                      },
                      child: Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Order $index",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              Text("Mobile: ${state.requsts[index].number}"),
                              Text(
                                  "Status: ${state.requsts[index].requestState}"),
                              Text(
                                  "Start Date: ${state.requsts[index].startTime}"),
                              Text("End Date: ${state.requsts[index].endTime}"),
                              Text(
                                  "Warranty State : ${state.requsts[index].warrantyState}"),
                              Text(
                                  "Consumed Parts: ${state.requsts[index].consumableParts}"),
                              Text("Price: ${state.requsts[index].salary}"),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : state is ShowRequstsFailureState
                  ? CustomError(message: state.errorMessage)
                  : const CustomProgressIndicator(),
        );
      },
    );
  }
}

extension DateFormatExtension on DateTime {
  String toShortDateString() {
    return "${this.day}/${this.month}/${this.year}";
  }
}
