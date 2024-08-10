import 'package:auto_size_text/auto_size_text.dart';
import '/features/home/pages/scaner_home/widgets/product_container.dart';
import 'package:flutter/material.dart';

import '/data/models/product_model.dart';

import '../../../../../utils/insets.dart';

class ProductHeader extends StatelessWidget {
  final Product product;

  const ProductHeader({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductContainer(
      child: Padding(
        padding: const EdgeInsets.all(Insets.s),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AutoSizeText(
                    "Product:",
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  AutoSizeText(
                    product.name,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const AutoSizeText(
                    "Producer:",
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  AutoSizeText(
                    product.producer,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
