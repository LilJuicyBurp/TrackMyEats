import 'package:flutter/material.dart';
import '../../../widgets/buttonStyle/auth_button_style.dart';

class AuthButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String label;
  final void Function()? onPressed;

  const AuthButton({
    Key? key,
    required this.formKey,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width / 1.7,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: authButtonStyle(),
        child: Text(
          label,
          style: const TextStyle(color: Colors.red, fontSize: 16),
        ),
      ),
    );
  }
}
