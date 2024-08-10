// ignore_for_file: must_be_immutable

import '/bloc/auth/auth_bloc.dart';
import '/features/auth/Widgets/auth_button.dart';
import '/features/auth/Widgets/auth_email_text_field.dart';
import '/features/auth/Widgets/auth_loading_button.dart';
import '/features/auth/Widgets/auth_title.dart';
import '/utils/insets.dart';
import '/utils/validator.dart';
import '/widgets/inputDecoration/border_none.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInContext extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  SignInContext({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AuthTitle(label: "Sign in"),
        const SizedBox(height: 100),
        Form(
          key: _formKey,
          child: Column(
            children: [
              AuthEmailTextField(
                  onSaved: (newEmail) => _email = newEmail ?? ""),
              const SizedBox(height: Insets.xs),
              _passwordTextField(width),
              const SizedBox(height: Insets.xs),
              const SizedBox(height: 4),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is LogginIn) {
                    return const AuthLoadingButton();
                  }
                  return AuthButton(
                    formKey: _formKey,
                    label: "Sign in",
                    onPressed: () {
                      final isValid = _formKey.currentState?.validate();
                      if (isValid == true) {
                        _formKey.currentState?.save();
                        BlocProvider.of<AuthBloc>(context).add(
                          SignIn(email: _email, password: _password),
                        );
                      }
                    },
                  );
                },
              ),
              _forgotPasswdButton(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _passwordTextField(double width) => SizedBox(
        width: width / 1.7,
        child: TextFormField(
          obscureText: true,
          cursorColor: Colors.white,
          decoration: borderNone(
            "Password",
            const Icon(
              Icons.password,
              color: Colors.white,
            ),
          ),
          style: const TextStyle(color: Colors.white),
          validator: (value) {
            if (Validator.isStringNull(value)) {
              return null;
            }
            return "Field is empty!";
          },
          onSaved: (newPassword) => _password = newPassword ?? "",
        ),
      );

  Widget _forgotPasswdButton(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Forgot password?",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(width: Insets.xs),
          TextButton(
            onPressed: () => context.go("/forgot_password"),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            child: const Text(
              "Refresh",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      );
}
