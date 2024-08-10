// ignore_for_file: must_be_immutable

import '/bloc/auth/auth_bloc.dart';
import '/features/auth/Widgets/auth_button.dart';
import '/features/auth/Widgets/auth_email_text_field.dart';
import '/utils/insets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Widgets/auth_loading_button.dart';
import '../Widgets/auth_title.dart';

class ForgotContext extends StatelessWidget {
  String _email = "";
  final _formKey = GlobalKey<FormState>();

  ForgotContext({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AuthTitle(label: "Forgot Password"),
        const SizedBox(height: 100),
        Form(
          key: _formKey,
          child: Column(
            children: [
              AuthEmailTextField(
                  onSaved: (newEmail) => _email = newEmail ?? ""),
              const SizedBox(height: Insets.xs),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is SendingRefreshEmail) {
                    return const AuthLoadingButton();
                  }
                  return AuthButton(
                    formKey: _formKey,
                    label: "Refresh password",
                    onPressed: () {
                      final isValid = _formKey.currentState?.validate();
                      if (isValid == true) {
                        _formKey.currentState?.save();
                        BlocProvider.of<AuthBloc>(context)
                            .add(RefreshPassword(email: _email));
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
