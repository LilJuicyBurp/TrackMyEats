import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '/data/models/product_model.dart';

import '../../../../../utils/calorie_calculator.dart';

class FrontPackLabel extends StatelessWidget {
  final Product product;
  const FrontPackLabel({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: _foodLabelElement(
              "Energy",
              "${product.nutritionalLabelling.energy}",
              Colors.white,
              const AutoSizeText(
                "kcal",
                maxLines: 1,
                style: TextStyle(color: Colors.black),
              )),
        ),
        Expanded(
          child: _foodLabelElement(
            "Fat",
            "${product.nutritionalLabelling.fat}g",
            CalorieCalculator.fatValueColor(
              product.nutritionalLabelling.fat,
            ),
          ),
        ),
        Expanded(
          child: _foodLabelElement(
            "Saturated",
            "${product.nutritionalLabelling.saturated}g",
            CalorieCalculator.saltsValueColor(
              product.nutritionalLabelling.saturated,
            ),
          ),
        ),
        Expanded(
          child: _foodLabelElement(
            "Sugars",
            "${product.nutritionalLabelling.sugar}g",
            CalorieCalculator.sugarsValueColor(
              product.nutritionalLabelling.sugar,
            ),
          ),
        ),
        Expanded(
          child: _foodLabelElement(
            "Salts",
            "${product.nutritionalLabelling.salt}g",
            CalorieCalculator.saltsValueColor(
              product.nutritionalLabelling.salt,
            ),
          ),
        ),
      ],
    );
  }

  Widget _foodLabelElement(String title, String value, Color color,
          [Widget? bottom]) =>
      Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.elliptical(500, 150),
          ),
          border: Border.all(color: Colors.black),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                title,
                maxLines: 1,
                style: const TextStyle(color: Colors.black),
              ),
              AutoSizeText(
                value,
                maxLines: 1,
                style: const TextStyle(color: Colors.black),
              ),
              bottom ?? const SizedBox(),
            ],
          ),
        ),
      );
}
