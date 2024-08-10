import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ProfileDefaultTitle extends StatelessWidget {
  final String title;
  const ProfileDefaultTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      style: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }
}
