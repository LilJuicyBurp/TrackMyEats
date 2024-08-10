import '/utils/insets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConclusionEndButton extends StatelessWidget {
  const ConclusionEndButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () => context.pop(),
        icon: const Icon(Icons.save),
        label: const Padding(
          padding:
              EdgeInsets.symmetric(vertical: Insets.s, horizontal: Insets.xs),
          child: Text("End conlusion"),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
