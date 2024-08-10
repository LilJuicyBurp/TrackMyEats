// ignore_for_file: must_be_immutable

import '/bloc/auth/auth_bloc.dart';
import '/features/auth/Widgets/auth_button.dart';
import '/features/auth/Widgets/auth_email_text_field.dart';
import '/features/auth/Widgets/auth_loading_button.dart';
import '/utils/insets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/inputDecoration/border_none.dart';
import '../Widgets/auth_title.dart';

class SignUpContext extends StatelessWidget {
  String _email = "";
  String _password = "";
  String _repatPassword = "";
  final _formKey = GlobalKey<FormState>();
  SignUpContext({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(Insets.s),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AuthTitle(label: "Sign up"),
          const SizedBox(height: 100),
          Form(
            key: _formKey,
            child: Column(
              children: [
                AuthEmailTextField(
                    onSaved: (newEmail) => _email = newEmail ?? ""),
                const SizedBox(height: Insets.xs),
                _passwdTextField(width),
                const SizedBox(height: Insets.xs),
                _repeatPasswdTextField(width),
                const SizedBox(height: Insets.xs),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (State is CreatingAccount) {
                      return const AuthLoadingButton();
                    }
                    return AuthButton(
                      formKey: _formKey,
                      label: "Sign up",
                      onPressed: () {
                        final isValid = _formKey.currentState?.validate();
                        if (isValid == true) {
                          _formKey.currentState?.save();
                          BlocProvider.of<AuthBloc>(context)
                              .add(SignUp(email: _email, password: _password));
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _passwdTextField(double width) => SizedBox(
        width: width / 1.7,
        child: TextFormField(
          obscureText: true,
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white),
          decoration: borderNone(
            "Password",
            const Icon(
              Icons.password,
              color: Colors.white,
            ),
          ),
          onChanged: (password) => _password = password,
        ),
      );

  Widget _repeatPasswdTextField(double width) => SizedBox(
        width: width / 1.7,
        child: TextFormField(
          obscureText: true,
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white),
          decoration: borderNone(
            "Repeat password",
            const Icon(
              Icons.password,
              color: Colors.white,
            ),
          ),
          validator: (value) {
            if (_password != _repatPassword) {
              return "passwords didn't match";
            }
            return null;
          },
          onChanged: (password) => _repatPassword = password,
        ),
      );
}
