import 'package:cloud_firestore/cloud_firestore.dart';
import '/data/models/product_model.dart';
import '/data/repository/model_repository/product_repository/base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firestore;

  ProductRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getProductsByBarcode(String barcode) {
    final productRef =
        _firestore.collection('product').where('barcode', isEqualTo: barcode);
    return productRef.snapshots().map((products) =>
        products.docs.map((product) => Product.fromSnapshot(product)).toList());
  }

  @override
  Stream<List<Product>> getProductsByName(String name) {
    final productRef = _firestore
        .collection('product')
        .where('name', isGreaterThanOrEqualTo: name.toLowerCase())
        .where('name', isLessThan: '${name.toLowerCase()}z');
    return productRef.snapshots().map((products) =>
        products.docs.map((product) => Product.fromSnapshot(product)).toList());
  }

  @override
  Future<void> createNewProduct(Product product) async {
    final productRef = _firestore.collection('product');
    await productRef.add(product.toMap());
  }
}
