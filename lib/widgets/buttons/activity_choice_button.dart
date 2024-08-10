// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '/data/models/activity_item.dart';

import '../../utils/insets.dart';

class ActivityChoiceButton extends StatelessWidget {
  final ActivityItem activity;
  final ValueChanged<ActivityItem> onPicked;
  final Color backgroundColor;
  final Color foregroundColor;
  const ActivityChoiceButton({
    Key? key,
    required this.activity,
    required this.onPicked,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPicked(activity),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            topLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
            topRight: Radius.circular(20),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Insets.xs),
        child: Column(
          children: <Widget>[
            Expanded(flex: 3, child: LottieBuilder.asset(activity.lottiePath)),
            const SizedBox(height: Insets.xs),
            Expanded(
              child: AutoSizeText(
                activity.label,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: foregroundColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
