import 'package:flutter/material.dart';

BoxDecoration homeGradientBacground() => const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Colors.red,
          Colors.orange,
        ],
      ),
    );
