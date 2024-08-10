import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeSignUpButton extends StatelessWidget {
  const WelcomeSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width / 2,
      child: OutlinedButton(
        onPressed: () => context.go("/signIn"),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(width: 2, color: Colors.white),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              topLeft: Radius.circular(5),
            ),
          ),
        ),
        child: const Text(
          "Sign in",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
