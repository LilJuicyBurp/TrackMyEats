import 'package:flutter/material.dart';

class WelcomeTitle extends StatelessWidget {
  const WelcomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "FitFitMeal",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50,
            color: Colors.white,
          ),
        ),
        Text(
          "Eat healthy, feel great!",
          style: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 18),
        ),
      ],
    );
  }
}
