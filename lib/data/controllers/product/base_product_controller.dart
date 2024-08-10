import '/data/models/product_model.dart';

abstract class BaseProductController {
  Future<List<Product>> loadProductByName(String name);

  Future<List<Product>> loadProductByBarcode(String barcode);

  Future<void> addNewProduct(Product product);
}
