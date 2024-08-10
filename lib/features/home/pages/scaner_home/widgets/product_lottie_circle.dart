import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../utils/insets.dart';

class ProductLottieCircle extends StatelessWidget {
  const ProductLottieCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 110,
      child: Padding(
        padding: const EdgeInsets.all(Insets.s),
        child: LottieBuilder.asset("assets/lottie/food.json"),
      ),
    );
  }
}
