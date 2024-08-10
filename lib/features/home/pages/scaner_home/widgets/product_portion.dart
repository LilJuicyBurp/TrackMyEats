// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import '/bloc/user/user_bloc.dart';
import '/data/models/food_label_model.dart';
import '/features/home/pages/scaner_home/widgets/product_container.dart';
import '/utils/calorie_calculator.dart';
import '/utils/decimal_text_input_formatter.dart';
import 'package:flutter/material.dart';

import '/data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../utils/insets.dart';

class ProductPortion extends StatelessWidget {
  final Product product;

  const ProductPortion({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    GlobalKey<FormState> key = GlobalKey<FormState>();
    return ProductContainer(
      child: Padding(
        padding: const EdgeInsets.all(Insets.s),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const AutoSizeText(
              "Your meal",
              maxLines: 1,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Form(
                    key: key,
                    child: TextFormField(
                      controller: controller,
                      validator: (value) {
                        if (value == "") {
                          return "value can't be null";
                        }
                        return null;
                      },
                      inputFormatters: [
                        DecimalTextInputFormatter(decimalRange: 2)
                      ],
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w400,
                        ),
                        labelText: "Grams: ",
                        focusColor: Colors.red,
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.red.withOpacity(0.6)),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                      cursorColor: Colors.red,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: Insets.xs),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (key.currentState!.validate()) {
                    num mealWheight = num.parse(controller.text);
                    Product result = Product(
                      barcode: product.barcode,
                      name: product.name,
                      producer: product.producer,
                      unit: product.unit,
                      nutritionalLabelling: FoodLabel(
                        energy: CalorieCalculator.proportion(
                            product.nutritionalLabelling.energy, mealWheight),
                        fat: CalorieCalculator.proportion(
                            product.nutritionalLabelling.fat, mealWheight),
                        saturated: CalorieCalculator.proportion(
                            product.nutritionalLabelling.saturated,
                            mealWheight),
                        protein: CalorieCalculator.proportion(
                            product.nutritionalLabelling.protein, mealWheight),
                        salt: CalorieCalculator.proportion(
                            product.nutritionalLabelling.salt, mealWheight),
                        sugar: CalorieCalculator.proportion(
                            product.nutritionalLabelling.sugar, mealWheight),
                        carbohydrates: CalorieCalculator.proportion(
                            product.nutritionalLabelling.carbohydrates,
                            mealWheight),
                      ),
                    );
                    context.go("/home/conclusion", extra: result);
                    BlocProvider.of<UserBloc>(context).add(
                      UpdateUserStats(
                        label: FoodLabel(
                            energy: result.nutritionalLabelling.energy,
                            fat: result.nutritionalLabelling.fat,
                            saturated: result.nutritionalLabelling.saturated,
                            protein: result.nutritionalLabelling.protein,
                            salt: result.nutritionalLabelling.salt,
                            sugar: result.nutritionalLabelling.sugar,
                            carbohydrates:
                                result.nutritionalLabelling.carbohydrates),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(Insets.xs + 2),
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UpdatingUserStats) {
                        return const CircularProgressIndicator(
                          color: Colors.white,
                        );
                      }
                      return const AutoSizeText(
                        "Save",
                        maxLines: 1,
                        style: TextStyle(fontSize: 16),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
