import 'package:auto_size_text/auto_size_text.dart';
import '/data/models/product_model.dart';
import '/features/home/pages/scaner_home/widgets/result_button.dart';
import '/utils/insets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class ProductsResults extends StatelessWidget {
  final Stream<List<Product>> stream;
  const ProductsResults({required this.stream, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Insets.s),
          child: StreamBuilder<List<Product>>(
            stream: stream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return _onHasError(snapshot.error, snapshot.stackTrace);
              } else {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return _onConnectionStateNone();
                  case ConnectionState.waiting:
                    return _onConnectionStateWating();
                  case ConnectionState.active:
                    if (snapshot.data!.isNotEmpty) {
                      return _productsResults(snapshot.data!);
                    } else {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const AutoSizeText(
                              "No matches...",
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: Insets.xxl),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () =>
                                    context.go('/home/add_product'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.red,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(Insets.s),
                                  child: AutoSizeText(
                                    "Add new product!",
                                    maxLines: 1,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  case ConnectionState.done:
                    if (snapshot.data!.isNotEmpty) {
                      return _productsResults(snapshot.data!);
                    } else {
                      return const Center(
                        child: Column(
                          children: [
                            Text(
                              "No matches...",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                }
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _onHasError(Object? error, StackTrace? stackTrace) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.white),
            const SizedBox(height: Insets.s),
            AutoSizeText('Error: $error'),
            const SizedBox(height: Insets.xs),
            AutoSizeText('Stack trace: $stackTrace'),
          ],
        ),
      );

  Widget _onConnectionStateNone() => const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.info,
              color: Colors.blue,
              size: 60,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Select a lot'),
            ),
          ],
        ),
      );

  Widget _onConnectionStateWating() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset("assets/lottie/loading_fork.json"),
            const SizedBox(height: Insets.xs),
            const AutoSizeText("Loading data..."),
          ],
        ),
      );

  Widget _productsResults(List<Product> products) => ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Insets.s, vertical: Insets.xs),
            child: ResultButton(
              product: products[index],
            ),
          );
        },
      );
}
