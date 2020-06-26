import 'dart:math';

import 'package:flutter/material.dart';

class ClockPaint extends CustomPainter {
  Paint _outerArc; // Representa o arco branco mais externo
  Paint _innerCircle; // Representa o circulo preto interno
  Paint _secondsLine; // Representa o ponteiro dos segundos
  Paint _minutesLine; // Representa o ponteiro dos segundos
  Paint _hoursLine; // Representa o ponteiro dos segundos
  Paint _outerCenterCircle; // Representa o circulo branco central dos ponteiros
  Paint _innerCenterCircle; // Representa o circulo vermelho central

  ClockPaint() {
    // Definindo aparencia do arco externo
    _outerArc = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12;

    // Definindo aparencia do circulo interno
    _innerCircle = Paint()
      ..color = Color(0xff1B1C1F)
      ..style = PaintingStyle.fill;

    // Definindo aparencia do ponteiro dos segundos
    _secondsLine = Paint()
      ..color = Color(0xff8C3939)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    // Definindo aparencia do ponteiro dos minutos
    _minutesLine = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    // Definindo aparencia do ponteiro dos minutos
    _hoursLine = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    // Definindo aparencia do circulo externo central dos ponteiros
    _outerCenterCircle = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    // Definindo aparencia do circulo vermelho interno no centro dos ponteiros
    _innerCenterCircle = Paint()
      ..color = Color(0xff8C3939)
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width * .5;
    final centerY = size.height * .5;
    final center = Offset(centerX, centerY);
    final radius = centerX;

    // Define a funcionalidade do relogio
    final now = DateTime.now();
    final hourDegree = (360 / 12) * now.hour; // Calculando a hora
    final minuteDegree = (360 / 60) * now.minute; // Calculando a hora
    final secondDegree = (360 / 60) * now.second; // Calculando a hora

// Desenhando o arco mais externo
    canvas.drawArc(
      Rect.fromCenter(
        center: center,
        width: size.width,
        height: size.height,
      ),
      0,
      pi * 2,
      false,
      _outerArc,
    );

    // Desenhando o circulo interno
    canvas.drawCircle(
      center, // Onde será o centro do desenho
      radius, // Qual será o raio da circunferência
      _innerCircle, // Qual é o objeto que contém as propriedades da pintura
    );

    // Desenhando o ponteiro dos minutos
    final _minutesLineWidth = radius / 1.25;
    final _minutesLineRadians = degreeToRadians(minuteDegree);
    canvas.drawLine(
      Offset(
        centerX + cos(_minutesLineRadians) * _minutesLineWidth,
        centerX + sin(_minutesLineRadians) * _minutesLineWidth,
      ),
      center,
      _minutesLine,
    );

    // Desenhando o ponteiro das horas
    final _hoursLineWidth = radius / 2;
    final _hoursLineRadians = degreeToRadians(hourDegree);
    canvas.drawLine(
      Offset(
        centerX + cos(_hoursLineRadians) * _hoursLineWidth,
        centerX + sin(_hoursLineRadians) * _hoursLineWidth,
      ),
      center,
      _hoursLine,
    );

    // Desenhando o ponteiro dos segundos
    final _secondsLineWidth = radius / 1.25;
    final _secondsLineRadians = degreeToRadians(secondDegree);
    canvas.drawLine(
      Offset(
        centerX + cos(_secondsLineRadians) * _secondsLineWidth,
        centerX + sin(_secondsLineRadians) * _secondsLineWidth,
      ),
      center,
      _secondsLine,
    );

    // Desenhando o circulo externo do centro dos ponteiros
    canvas.drawCircle(
      center,
      5,
      _outerCenterCircle,
    );

    // Desenhando o circulo vermelho interno do centro dos ponteiros
    canvas.drawCircle(
      center,
      4,
      _innerCenterCircle,
    );
  }

  double degreeToRadians(double degree) => 0.0174532925 * degree;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
