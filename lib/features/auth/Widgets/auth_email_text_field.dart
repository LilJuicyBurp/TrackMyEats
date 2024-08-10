import 'package:flutter/material.dart';

import '../../../utils/validator.dart';
import '../../../widgets/inputDecoration/border_top_left.dart';

class AuthEmailTextField extends StatelessWidget {
  final void Function(String?)? onSaved;
  const AuthEmailTextField({
    Key? key,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width / 1.7,
      child: TextFormField(
        enableSuggestions: true,
        cursorColor: Colors.white,
        keyboardType: TextInputType.emailAddress,
        decoration: borderTopLeft(
          "Email",
          const Icon(
            Icons.email,
            color: Colors.white,
          ),
        ),
        style: const TextStyle(color: Colors.white),
        validator: (value) {
          if (Validator.isEmail(value)) {
            return null;
          }
          return "email is incorrect!";
        },
        onSaved: onSaved,
      ),
    );
  }
}
