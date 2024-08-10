import '/data/models/product_model.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getProductsByBarcode(String barcode);

  Stream<List<Product>> getProductsByName(String name);

  Future<void> createNewProduct(Product product);
}
