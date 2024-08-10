import 'package:auto_size_text/auto_size_text.dart';
import '/utils/insets.dart';
import 'package:flutter/material.dart';

import '../../../utils/tutorial_elements_shape.dart';

class HeightPicker extends StatelessWidget {
  final int height;
  final ValueChanged<double> onChanged;
  const HeightPicker({
    Key? key,
    required this.height,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: tutorialElementsRadius(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Insets.xs, vertical: Insets.s),
        child: Column(
          children: <Widget>[
            AutoSizeText(
              "Height $height cm",
              maxLines: 1,
              style: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(height: Insets.s),
            Slider.adaptive(
              thumbColor: Colors.red,
              activeColor: Colors.red,
              inactiveColor: const Color.fromARGB(74, 244, 67, 54),
              label: "$height",
              value: height.toDouble(),
              onChanged: (value) => onChanged(value),
              min: 0,
              max: 300,
            ),
          ],
        ),
      ),
    );
  }
}
