import 'package:flutter/material.dart';

import '../../../widgets/buttonStyle/auth_button_style.dart';

class AuthLoadingButton extends StatelessWidget {
  const AuthLoadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width / 1.7,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: authButtonStyle(),
        child: const CircularProgressIndicator(
          color: Colors.red,
        ),
      ),
    );
  }
}
