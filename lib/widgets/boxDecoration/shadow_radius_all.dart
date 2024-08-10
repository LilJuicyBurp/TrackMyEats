import 'package:flutter/material.dart';

BoxDecoration shadowRadiusAll(double radius) => BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: const [
        BoxShadow(
            color: Color.fromARGB(50, 116, 0, 0),
            blurRadius: 2,
            spreadRadius: 1,
            offset: Offset(3, 3)),
      ],
    );
