import '/features/tutorial/utils/tutorial_elements_shape.dart';
import 'package:flutter/material.dart';

ButtonStyle tutorialElevatedButtonDecoration() => ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: tutorialElementsRadius(),
      ),
    );
