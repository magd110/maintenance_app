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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('اختر اليوم المناسب لك:'),
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
