import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PrestamoProgress extends StatefulWidget {
  PrestamoProgress(this.estado);
  final String estado;
  @override
  _PrestamoProgressState createState() => _PrestamoProgressState();
}

class _PrestamoProgressState extends State<PrestamoProgress> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CircularPercentIndicator(
        radius: 48,
        lineWidth: 3.5,
        percent: 0.6,
        animation: true,
        animationDuration: 1500,
        center: Text("60%"),
        progressColor:
            widget.estado == 'Al día' ? Colors.teal[300] : Colors.red,
        backgroundColor:
            widget.estado == 'Al día' ? Color(0xffb2dfdb) : Color(0xffffcdd2),
        startAngle: 180.0,
      ),
    );
  }
}
