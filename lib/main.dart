import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/clock/clock_widget.dart';

main() => runApp(AnalogClock());

class AnalogClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnalogClock',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF3C3D43),
        body: ClockWidget(),
      ),
    );
  }
}
