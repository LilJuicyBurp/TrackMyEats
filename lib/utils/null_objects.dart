import '/data/models/food_label_model.dart';
import '/data/models/product_model.dart';

class NullObjects {
  // ignore: prefer_const_constructors
  static FoodLabel foodLabel = FoodLabel(
      energy: 0,
      fat: 0,
      saturated: 0,
      protein: 0,
      salt: 0,
      sugar: 0,
      carbohydrates: 0);

  static Product product = Product(
      barcode: "",
      name: "",
      producer: "",
      unit: "",
      nutritionalLabelling: foodLabel);
}
