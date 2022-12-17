import 'price_model.dart';

class PricesList {
  PricesList._sharedInstance();
  static final PricesList _shared = PricesList._sharedInstance();
  factory PricesList() => _shared;
  List<PriceModel> materialsList = [];
  List<PriceModel> productsList = [];
}
