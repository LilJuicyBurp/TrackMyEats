import '/features/auth/forgot_password/forgot_context.dart';
import '/widgets/boxDecoration/home_gradnient_bacground.dart';
import '/widgets/buttons/pop_back_arrow.dart';
import '/widgets/snackBar/error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../bloc/auth/auth_bloc.dart';

class ForgotPasswdPage extends StatelessWidget {
  const ForgotPasswdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RefreshEmailSend) {
            context.go("/");
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
                ForgotContext(),
                const Positioned(
                  top: 5,
                  left: 5,
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
