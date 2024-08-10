import '/features/auth/signIn/sign_in_context.dart';
import '/utils/insets.dart';
import '/widgets/boxDecoration/home_gradnient_bacground.dart';
import '/widgets/buttons/pop_back_arrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../bloc/auth/auth_bloc.dart';
import '../../../widgets/snackBar/error_snack_bar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoggedIn) {
            context.go("/home");
          }
          if (state is AuthError) {
            showErrorSnackBar(state.error, context);
          }
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: homeGradientBacground(),
          child: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SignInContext(),
                const Positioned(
                  top: Insets.xs,
                  left: Insets.xs,
                  child: PopBackArrow(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
