import 'package:erp/screens/home/components/people_view/components/suppliers/data/supplier_model.dart';

class SuppliersList {
  SuppliersList._sharedInstance();
  static final SuppliersList _shared = SuppliersList._sharedInstance();
  factory SuppliersList() => _shared;
  List<SupplierModel> suppliersList = [];
}
