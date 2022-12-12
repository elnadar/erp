// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum WeightUnits { kg, tn, gm, mg }

WeightUnits getWeightUnitEnum(String str) {
  str = str.toLowerCase();
  if (str == "tn") {
    return WeightUnits.tn;
  } else if (str == "kg") {
    return WeightUnits.kg;
  } else if (str == "gm") {
    return WeightUnits.gm;
  }
  return WeightUnits.mg;
}

String getWeightUnitAr(WeightUnits units) {
  if (units == WeightUnits.tn) {
    return "طن";
  } else if (units == WeightUnits.kg) {
    return "كجم";
  } else if (units == WeightUnits.gm) {
    return "جم";
  }
  return "ملجم";
}

class MaterialModel {
  final int? id;
  final String name;
  final double quantity;
  final WeightUnits? measurement;
  final String? notes;
  final int? supplierId;
  MaterialModel({
    this.id,
    required this.name,
    required this.quantity,
    this.measurement,
    this.notes,
    this.supplierId,
  });

  static List<String> get columns => [
        '_id',
        'name',
        'quantity',
        'measurement',
        'notes',
        'supplier_id',
      ];
  MaterialModel copyWith({
    int? id,
    String? name,
    double? quantity,
    WeightUnits? measurement,
    String? notes,
    int? supplierId,
  }) {
    return MaterialModel(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      measurement: measurement ?? this.measurement,
      notes: notes ?? this.notes,
      supplierId: supplierId ?? this.supplierId,
    );
  }

  Map<String, dynamic> toSqlInsert() {
    return <String, dynamic>{
      'name': name == '' ? null : name,
      'quantity': quantity,
      'measurement': measurement?.name,
      'notes': notes == '' ? null : notes,
      'supplier_id': supplierId,
    };
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'quantity': quantity,
      'measurement': measurement?.name,
      'notes': notes,
      'supplier_id': supplierId,
    };
  }

  factory MaterialModel.fromMap(Map<String, dynamic> map) {
    return MaterialModel(
      id: map['_id'] != null ? map['_id'] as int : null,
      name: map['name'] as String,
      quantity: map['quantity'] as double,
      measurement: map['measurement'] != null
          ? getWeightUnitEnum(map['measurement'])
          : null,
      notes: map['notes'] != null ? map['notes'] as String : null,
      supplierId: map['supplier_id'] != null ? map['supplier_id'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MaterialModel.fromJson(String source) =>
      MaterialModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MaterialsModel(id: $id, name: $name, quantity: $quantity, measurement: $measurement, notes: $notes, supplierId: $supplierId)';
  }

  @override
  bool operator ==(covariant MaterialModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.quantity == quantity &&
        other.measurement == measurement &&
        other.notes == notes &&
        other.supplierId == supplierId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        quantity.hashCode ^
        measurement.hashCode ^
        notes.hashCode ^
        supplierId.hashCode;
  }
}
