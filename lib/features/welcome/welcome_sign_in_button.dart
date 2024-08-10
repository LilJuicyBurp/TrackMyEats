import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeSignInButton extends StatelessWidget {
  const WelcomeSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width / 2,
      child: ElevatedButton(
        onPressed: () => context.go("/signUp"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              topLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
          ),
        ),
        child: const Text(
          "Sign up",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
