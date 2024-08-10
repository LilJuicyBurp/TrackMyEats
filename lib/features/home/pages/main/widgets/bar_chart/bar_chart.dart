// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

import '/utils/insets.dart';

import 'bar.dart';

class BarChart extends StatelessWidget {
  final List<double> data;
  final List<String>? labels;
  final bool enableLabels;
  final Decoration? decoration;
  final Color? activeColor;
  final Color? inactiveColor;
  final double? height;
  final double? width;
  final Widget? title;
  final Widget? subtitle;
  final Widget? footer;
  const BarChart({
    Key? key,
    required this.data,
    this.labels,
    this.enableLabels = false,
    this.decoration,
    this.activeColor,
    this.inactiveColor,
    this.height,
    this.width,
    this.title,
    this.subtitle,
    this.footer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      height: height,
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(Insets.s),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            title ?? const SizedBox(),
            subtitle ?? const SizedBox(),
            const SizedBox(height: Insets.xs),
            _bars(),
            footer ?? const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _bars() {
    int labelIndex = 0;

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ...data
              .map(
                (value) => Expanded(
                  child: Bar(
                    value: _calculateValue(data, value),
                    activeColor: activeColor,
                    inactiveColor: inactiveColor,
                    label: labels?.length == data.length && enableLabels
                        ? Text(
                            labels![labelIndex++],
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : null,
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }

  double _calculateValue(List<double> data, double value) =>
      value / data.reduce(max);
}
