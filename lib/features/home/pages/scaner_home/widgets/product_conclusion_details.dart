// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import '/features/home/pages/scaner_home/widgets/product_container.dart';
import 'package:flutter/material.dart';
import '/data/models/product_model.dart';
import '../../../../../utils/insets.dart';

class ProductConclusionDetails extends StatelessWidget {
  final Product product;
  const ProductConclusionDetails({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductContainer(
      shadow: false,
      child: Padding(
        padding: const EdgeInsets.all(Insets.s),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AutoSizeText(
              "Details:",
              maxLines: 1,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: Insets.xs),
            _nutritionRow("Energy:",
                "${product.nutritionalLabelling.energy.ceil()} kcal"),
            _nutritionRow("Fat:",
                "${product.nutritionalLabelling.fat.toStringAsFixed(2)}g"),
            _nutritionRow("Saturated:",
                "${product.nutritionalLabelling.saturated.toStringAsFixed(2)}g"),
            _nutritionRow("Sodium:",
                "${product.nutritionalLabelling.salt.toStringAsFixed(2)}g"),
            _nutritionRow("Carbohydrates:",
                "${product.nutritionalLabelling.carbohydrates.toStringAsFixed(2)}g"),
            _nutritionRow("Sugar:",
                "${product.nutritionalLabelling.sugar.toStringAsFixed(2)}g"),
            _nutritionRow("Protein:",
                "${product.nutritionalLabelling.protein.toStringAsFixed(2)}g"),
          ],
        ),
      ),
    );
  }

  Widget _nutritionRow(String label, String value) => Row(
        children: [
          const Spacer(),
          Expanded(
            flex: 8,
            child: AutoSizeText(
              label,
              style: const TextStyle(
                  color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 4,
            child: AutoSizeText(
              value,
              style: const TextStyle(
                  color: Colors.red, fontSize: 19, fontWeight: FontWeight.w500),
            ),
          ),
          const Spacer(),
        ],
      );
}
