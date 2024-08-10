// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BMIChart extends StatelessWidget {
  final double? bmi;
  final Decoration? decoration;
  final double? height;
  final double? width;
  const BMIChart({
    Key? key,
    required this.bmi,
    this.decoration,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      height: height,
      width: width,
      child: Stack(
        children: [
          _background(),
          _pointer(),
        ],
      ),
    );
  }

  Widget _pointer() => Row(
        children: <Widget>[
          Expanded(flex: _beginPionterValue(bmi), child: Container()),
          const Icon(
            Icons.arrow_drop_down_circle_rounded,
            color: Colors.white,
          ),
          Expanded(flex: _endPionterValue(bmi), child: Container()),
        ],
      );

  int _beginPionterValue(double? bmi) {
    if (bmi != null) {
      if (bmi > 16) {
        if (bmi < 40) {
          return ((bmi - 16) / 24 * 100).toInt();
        }
        return 100;
      }
      return 0;
    }
    return 0;
  }

  int _endPionterValue(double? bmi) {
    if (bmi != null) {
      if (bmi > 16) {
        if (bmi < 40) {
          return 100 - ((bmi - 16) / 24 * 100).toInt();
        }
        return 0;
      }
      return 100;
    }
    return 0;
  }

  Widget _background() => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Colors.blue,
              Colors.green,
              Colors.yellow,
              Colors.red,
              Colors.purple,
            ],
          ),
        ),
      );
}
