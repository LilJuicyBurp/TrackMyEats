import 'package:flutter/material.dart';

void showErrorSnackBar(String error, BuildContext context) {
  final snackBar = SnackBar(
    content: Text(error),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
