import 'package:flutter/material.dart';

ButtonStyle authButtonStyle() => ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(5),
          topLeft: Radius.circular(5),
          bottomRight: Radius.circular(20),
          topRight: Radius.circular(5),
        ),
      ),
    );
