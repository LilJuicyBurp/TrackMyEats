// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '/utils/insets.dart';

class LabelledData extends StatelessWidget {
  final String label;
  final Widget data;
  final double? height;
  final double? width;
  final Decoration? decoration;
  const LabelledData({
    Key? key,
    required this.label,
    required this.data,
    this.height,
    this.width,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: decoration,
      child: Padding(
        padding: const EdgeInsets.all(Insets.s),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AutoSizeText(
              label,
              maxLines: 2,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const Divider(
              indent: Insets.s,
              endIndent: Insets.s,
              color: Color.fromARGB(100, 244, 67, 54),
              thickness: 1,
            ),
            data,
          ],
        ),
      ),
    );
  }
}
