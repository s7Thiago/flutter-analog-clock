import 'package:flutter/material.dart';

import 'clock_paint.dart';

class ClockWidget extends StatefulWidget {
  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size.square(180),
        painter: ClockPaint(),
      ),
    );
  }
}
