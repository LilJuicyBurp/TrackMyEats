// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../../utils/insets.dart';

class Bar extends StatelessWidget {
  final double value;
  final Widget? label;
  final Color? activeColor;
  final Color? inactiveColor;
  final double? height;
  final double? width;

  const Bar({
    Key? key,
    required this.value,
    this.label,
    this.activeColor,
    this.inactiveColor,
    this.height = double.infinity,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.xs),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: Container(
                color: inactiveColor ?? const Color.fromARGB(100, 244, 67, 54),
                height: height,
                width: width,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: !value.isNaN ? (100 * (1 - value)).toInt() : 100,
                      child: Container(),
                    ),
                    Expanded(
                      flex: !value.isNaN ? (100 * value).toInt() : 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: activeColor ?? Colors.red,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          label != null ? const SizedBox(height: 5) : const SizedBox(),
          label ?? const SizedBox(),
        ],
      ),
    );
  }
}
