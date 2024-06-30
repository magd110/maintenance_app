import 'package:day_picker/day_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectDay extends StatefulWidget {
  const SelectDay({super.key});

  @override
  State<SelectDay> createState() => _SelectDayState();
}

class _SelectDayState extends State<SelectDay> {
  final List<DayInWeek> _days = [
    DayInWeek("أحد", dayKey: "sunday", fontSize: 15.0),
    DayInWeek("إثنين", dayKey: "monday", fontSize: 5.0),
    DayInWeek("ثلاثاء", dayKey: "tuesday", fontSize: 15.0),
    DayInWeek("أربعاء", dayKey: "wednesday", fontSize: 15.0),
    DayInWeek("خميس", dayKey: "thursday", fontSize: 15.0),
    DayInWeek("جمعة", dayKey: "friday", isSelected: false, fontSize: 15.0),
    DayInWeek("سبت", dayKey: "saturday", isSelected: false, fontSize: 15.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('اختر اليوم المناسب لك:'),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: SelectWeekDays(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              days: _days,
              boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  // 10% of the width, so there are ten blinds.
                  colors: [
                    Colors.blue.shade300,
                    Colors.blue.shade700,
                  ], // whitish to gray
                  tileMode:
                      TileMode.repeated, // repeats the gradient over the canvas
                ),
              ),
              onSelect: (values) {
                print(values);
              },
            ),
          ),
        ),
      ]),
    ));
  }
}
