import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:maintenance_app1/core/utils/shared_preference_store.dart';
import 'package:maintenance_app1/core/widgets/custom_error.dart';
import 'package:maintenance_app1/core/widgets/custom_progress_indicator.dart';
import 'package:maintenance_app1/features/show_requsts/presentation/manager/rating_cubit/rating_cubit.dart';

class RatingTeam extends StatefulWidget {
  final int id;
  const RatingTeam({super.key, required this.id});

  @override
  _RatingTeamState createState() => _RatingTeamState();
}

class _RatingTeamState extends State<RatingTeam> {
  double _currentRating = 1;

  final TextEditingController note = TextEditingController();

  @override
  void dispose() {
    note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatingCubit, RatingState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Rate the Team'),
            backgroundColor: Colors.teal,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Please rate the team:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Center(
                  child: RatingBar.builder(
                    initialRating: _currentRating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        _currentRating = rating;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Reason for your rating:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  maxLines: 3,
                  controller: note,
                  decoration: InputDecoration(
                    hintText: 'Enter your reason here...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  // onChanged: (value) {
                  //   setState(() {
                  //     _ratingReason = value;
                  //   });
                  // },
                ),
                const SizedBox(height: 24),
                state is RatingLoadingState
                    ? const CustomProgressIndicator()
                    : Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            // Process the rating and reason
                            await BlocProvider.of<RatingCubit>(context)
                                .ratingTeam(
                              endPoint: 'rate_maintenance_team',
                              token: prefs.getString('token')!,
                              note: note.text,
                              numberOfStar: _currentRating,
                              teamId: widget.id,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: Colors.teal,
                          ),
                          child: const Text(
                            'Submit',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
                if (state is RatingFailureState)
                  CustomError(message: state.errorMessage)
                else if (state is RatingSuccessState)
                  Center(
                    child: Text(
                      state.ratingModel.message!,
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
