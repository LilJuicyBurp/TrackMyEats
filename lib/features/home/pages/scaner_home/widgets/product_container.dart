// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProductContainer extends StatelessWidget {
  final Widget child;
  final bool shadow;
  const ProductContainer({
    Key? key,
    required this.child,
    this.shadow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(30),
          topLeft: Radius.circular(30),
          topRight: Radius.circular(10),
        ),
        boxShadow: shadow
            ? [
                const BoxShadow(
                  color: Color.fromARGB(100, 94, 25, 20),
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: Offset(4, 4),
                ),
              ]
            : [],
      ),
      child: child,
    );
  }
}
