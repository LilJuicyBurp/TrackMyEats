import 'package:auto_size_text/auto_size_text.dart';
import 'package:fast_barcode_scanner/fast_barcode_scanner.dart';
import '/data/repository/model_repository/product_repository/product_repository.dart';
import '/utils/insets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class BarcodeScaner extends StatelessWidget {
  const BarcodeScaner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BarcodeCamera(
          types: const [
            BarcodeType.aztec,
            BarcodeType.ean8,
            BarcodeType.ean13,
            BarcodeType.code128,
            BarcodeType.code39,
            BarcodeType.upcA,
            BarcodeType.upcE,
            BarcodeType.codabar,
          ],
          framerate: Framerate.fps240,
          resolution: Resolution.hd4k,
          onScan: (barcode) {
            ProductRepository repo = ProductRepository();
            context.go("/home/results",
                extra: repo.getProductsByBarcode(barcode.value));
          },
          onError: (context, error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AutoSizeText(
                    "Error reading from camera...",
                    style: TextStyle(color: Colors.white),
                  ),
                  ElevatedButton(
                    onPressed: () => context.pop(),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white),
                    child: const Text("back"),
                  ),
                ],
              ),
            );
          },
          children: <Widget>[
            LottieBuilder.asset("assets/lottie/scanning.json"),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(Insets.s),
                child: ElevatedButton(
                  onPressed: () => context.pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(Insets.xs),
                    child: Text("Stop scanning"),
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
