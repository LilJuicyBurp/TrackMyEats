import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PopBackArrow extends StatelessWidget {
  const PopBackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.pop(),
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    );
  }
}
