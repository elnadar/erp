import 'product_model.dart';

class ProductsList {
  ProductsList._sharedInstance();
  static final ProductsList _shared = ProductsList._sharedInstance();
  factory ProductsList() => _shared;
  List<ProductModel> productsList = [];
}
