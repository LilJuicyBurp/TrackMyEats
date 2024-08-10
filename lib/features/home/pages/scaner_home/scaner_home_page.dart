import 'package:auto_size_text/auto_size_text.dart';
import '/features/home/pages/scaner_home/widgets/barcode_scan_button.dart';
import '/features/home/pages/scaner_home/widgets/product_lottie_circle.dart';
import '/features/home/pages/scaner_home/widgets/product_search_bar.dart';
import '/utils/insets.dart';
import '/widgets/menu/menu_widget.dart';
import 'package:flutter/material.dart';

class ScanerHomePage extends StatelessWidget {
  const ScanerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              leading: MenuWidget(),
              backgroundColor: Colors.orange,
              shadowColor: Colors.transparent,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(Insets.s),
                child: orientation == Orientation.portrait
                    ? _portraitView(size)
                    : _landscapeView(size),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _portraitView(Size size) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: size.height / 30),
          SizedBox(height: size.width / 2, child: const ProductLottieCircle()),
          SizedBox(height: size.height / 20),
          SizedBox(width: size.width / 1.5, child: _title()),
          SizedBox(height: size.height / 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Insets.s),
            child: _content(),
          ),
        ],
      );

  Widget _landscapeView(Size size) => Row(
        children: <Widget>[
          Expanded(
            flex: 11,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: size.height / 2.3,
                    child: const ProductLottieCircle()),
                const SizedBox(height: Insets.s),
                _title(),
              ],
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Expanded(flex: 12, child: _content()),
          const Spacer(),
        ],
      );

  Widget _title() => const Center(
        child: AutoSizeText(
          "Add product!",
          maxLines: 1,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
      );

  Widget _content() => Column(
        children: [
          ProductSearchBar(),
          const SizedBox(height: Insets.xs),
          const BarcodeScanButton(),
        ],
      );
}
