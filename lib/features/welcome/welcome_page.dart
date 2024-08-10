
import '/features/welcome/welcome_sign_in_button.dart';
import '/features/welcome/welcome_sign_up_button.dart';
import '/features/welcome/welcome_title.dart';
import '/widgets/boxDecoration/home_gradnient_bacground.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/auth/auth_bloc.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is UserIsAvailable) {
              context.go("/home");
            }
          },
          child: Center(
            child: Container(
              width: double.infinity,
              decoration: homeGradientBacground(),
              child: const SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WelcomeTitle(),
                    SizedBox(height: 150),
                    WelcomeSignUpButton(),
                    WelcomeSignInButton(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
