import 'dart:async';

import 'package:flutter/material.dart';
import 'package:minimalist_clock/size_config.dart';

class TimeInHourAndMinutes extends StatefulWidget {
  @override
  _TimeInHourAndMinutesState createState() => _TimeInHourAndMinutesState();
}

class _TimeInHourAndMinutesState extends State<TimeInHourAndMinutes> {
  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeOfDay.minute != TimeOfDay.now().minute) {
        setState(() {
          _timeOfDay = TimeOfDay.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String _period = _timeOfDay.period == DayPeriod.am ? 'AM' : "PM";

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${_timeOfDay.hour}:${_timeOfDay.minute}",
          style: Theme.of(context).textTheme.headline1,
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            _period,
            style: TextStyle(fontSize: getProportionateScreenWidth(10)),
          ),
        )
      ],
    );
  }
}
