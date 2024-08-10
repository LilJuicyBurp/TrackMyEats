import '/utils/insets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConclusionAddNewProductButton extends StatelessWidget {
  const ConclusionAddNewProductButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () => context.pop(),
        icon: const Icon(Icons.add),
        label: const Padding(
          padding:
              EdgeInsets.symmetric(vertical: Insets.s, horizontal: Insets.xs),
          child: Text("Add new product"),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.red,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
