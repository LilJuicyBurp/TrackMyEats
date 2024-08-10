import 'package:flutter/material.dart';

InputDecoration borderTopLeftLabeled(String label, [Icon? icon]) =>
    InputDecoration(
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Colors.white,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
      focusColor: Colors.white,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
      fillColor: const Color.fromARGB(57, 244, 67, 54),
      filled: true,
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      hintStyle: const TextStyle(
        color: Colors.white70,
      ),
      prefixIcon: icon,
      prefixIconColor: Colors.white70,
    );
