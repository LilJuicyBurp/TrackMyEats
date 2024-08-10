import 'package:auto_size_text/auto_size_text.dart';
import '/features/home/pages/scaner_home/widgets/product_container.dart';
import 'package:flutter/material.dart';
import '/data/models/product_model.dart';
import '../../../../../utils/calorie_calculator.dart';
import '../../../../../utils/daily_values.dart';
import '../../../../../utils/insets.dart';

class NutritonFactsLabel extends StatelessWidget {
  final Product product;
  const NutritonFactsLabel({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductContainer(
      child: Padding(
        padding: const EdgeInsets.all(Insets.s),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const AutoSizeText(
              "Nutrition Facts",
              maxLines: 1,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
            const Divider(
              thickness: 10,
              height: 20,
              color: Colors.red,
            ),
            _foodLabelCalories(),
            const Divider(
              thickness: 5,
              height: 15,
              color: Colors.red,
            ),
            _nutrities(),
            const Divider(
              thickness: 10,
              height: 30,
              color: Colors.red,
            ),
            _footer(),
          ],
        ),
      ),
    );
  }

  Widget _foodLabelCalories() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Amount per 100 grams",
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                AutoSizeText(
                  "Calories",
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 3,
            child: AutoSizeText(
              "${product.nutritionalLabelling.energy}",
              maxLines: 1,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
        ],
      );

  Widget _nutrities() => Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              AutoSizeText(
                "% Daily Value *",
                maxLines: 1,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.red,
          ),
          _netritionRow(
            "Fat",
            product.nutritionalLabelling.fat,
            "g",
            CalorieCalculator.calculateDailyValue(
              product.nutritionalLabelling.fat,
              DailyValues.fat,
            ).ceil(),
          ),
          const Divider(
            thickness: 1,
            color: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.only(left: Insets.s),
            child: _netritionRow(
              "Saturated",
              product.nutritionalLabelling.saturated,
              "g",
              CalorieCalculator.calculateDailyValue(
                product.nutritionalLabelling.saturated,
                DailyValues.saturated,
              ).ceil(),
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.red,
          ),
          _netritionRow(
            "Sodium",
            product.nutritionalLabelling.salt,
            "g",
            CalorieCalculator.calculateDailyValue(
              product.nutritionalLabelling.salt,
              DailyValues.sodium,
            ).ceil(),
          ),
          const Divider(
            thickness: 1,
            color: Colors.red,
          ),
          _netritionRow(
            "Totoal carbohydrates",
            product.nutritionalLabelling.carbohydrates,
            "g",
            CalorieCalculator.calculateDailyValue(
              product.nutritionalLabelling.carbohydrates,
              DailyValues.carbohydrate,
            ).ceil(),
          ),
          const Divider(
            thickness: 1,
            color: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.only(left: Insets.s),
            child: _netritionRow(
              "Sugar",
              product.nutritionalLabelling.sugar,
              "g",
              CalorieCalculator.calculateDailyValue(
                product.nutritionalLabelling.sugar,
                DailyValues.sugar,
              ).ceil(),
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.red,
          ),
          _netritionRow(
            "Protein",
            product.nutritionalLabelling.protein,
            "g",
            CalorieCalculator.calculateDailyValue(
              product.nutritionalLabelling.protein,
              DailyValues.protein,
            ).ceil(),
          ),
        ],
      );

  Widget _netritionRow(String title, num value, String unit,
          [num? dailyValue]) =>
      Row(
        children: [
          AutoSizeText(
            title,
            maxLines: 1,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: Insets.xs),
          AutoSizeText(
            "$value$unit",
            maxLines: 1,
            style: const TextStyle(
              color: Colors.red,
            ),
          ),
          const Spacer(),
          AutoSizeText(
            dailyValue != null ? "$dailyValue" : "",
            maxLines: 1,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          AutoSizeText(
            dailyValue != null ? "%" : "",
            maxLines: 1,
            style: const TextStyle(
              color: Colors.red,
            ),
          ),
        ],
      );

  Widget _footer() => const AutoSizeText(
        "* The % Daily Value (DV) tells you how much a nutrient in a serving of food contributes to a daily diet. 2,000 calories a day is used for general nutrition advice.",
        maxLines: 3,
        style: TextStyle(
          color: Colors.red,
        ),
      );
}
