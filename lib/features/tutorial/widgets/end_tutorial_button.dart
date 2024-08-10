// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../bloc/user/user_bloc.dart';
import '../../../data/models/user_model.dart';

class EndTutorialButton extends StatelessWidget {
  final double height;
  const EndTutorialButton({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserDataUpdated) {
          context.go("/home");
        }
        if (state is UserError) {
          context.go("/home");
        }
      },
      builder: (context, state) {
        if (state is UpdatingUserData) {
          return const CircularProgressIndicator(
            color: Colors.white,
          );
        }
        return Container(
          color: Colors.red,
          child: TextButton(
            onPressed: () => BlocProvider.of<UserBloc>(context)
                .add(UpdateUserData(user: UserModel.fromSharedPreferences())),
            style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              textStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              minimumSize: Size.fromHeight(height),
            ),
            child: const Text("Let's get started!"),
          ),
        );
      },
    );
  }
}
