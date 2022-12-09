import 'material_model.dart';

class MaterialsList {
  MaterialsList._sharedInstance();
  static final MaterialsList _shared = MaterialsList._sharedInstance();
  factory MaterialsList() => _shared;
  List<MaterialModel> materialsList = [];
}
