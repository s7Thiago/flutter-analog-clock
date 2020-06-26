import 'dart:async';

import 'package:flutter/material.dart';

import 'clock_paint.dart';

class ClockWidget extends StatefulWidget {
  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  Timer _timer;

  @override
  void initState() {
    // Timer que atualiza a tela para atualizar o relogio
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size.square(350),
        painter: ClockPaint(),
      ),
    );
  }
}
