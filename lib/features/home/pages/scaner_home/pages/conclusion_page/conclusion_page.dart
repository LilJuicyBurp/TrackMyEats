import '/features/home/pages/scaner_home/widgets/conclusion_add_new_prod_button.dart';
import '/features/home/pages/scaner_home/widgets/conclusion_end_burron.dart';
import '/features/home/pages/scaner_home/widgets/product_conclusion_details.dart';
import '/features/home/pages/scaner_home/widgets/product_lottie_circle.dart';
import '/utils/insets.dart';
import 'package:flutter/material.dart';

import '/data/models/product_model.dart';

class ConclusionPage extends StatelessWidget {
  final Product product;

  const ConclusionPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conclusion"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Insets.s),
              child: orientation == Orientation.portrait
                  ? _portraitView()
                  : _landscapeView(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _landscapeView() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: Insets.l),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                const Expanded(
                  flex: 4,
                  child: ProductLottieCircle(),
                ),
                const Spacer(),
                Expanded(
                  flex: 8,
                  child: ProductConclusionDetails(product: product),
                ),
              ],
            ),
            const SizedBox(height: Insets.s),
            const ConclusionAddNewProductButton(),
            const SizedBox(height: Insets.xs),
            const ConclusionEndButton(),
          ],
        ),
      );

  Widget _portraitView() => Column(
        children: <Widget>[
          const ProductLottieCircle(),
          const SizedBox(height: Insets.xl),
          ProductConclusionDetails(product: product),
          const SizedBox(height: Insets.l),
          const ConclusionAddNewProductButton(),
          const SizedBox(height: Insets.xs),
          const ConclusionEndButton(),
        ],
      );
}
