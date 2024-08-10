import '/data/models/food_label_model.dart';

abstract class BaseActivityRepository {
  String nullStat = const FoodLabel(
    energy: 0,
    fat: 0,
    saturated: 0,
    protein: 0,
    salt: 0,
    sugar: 0,
    carbohydrates: 0,
  ).toJson();

  bool isNextDay();

  Future<void> updateDay();

  Future<void> updateStats(FoodLabel label);
}
