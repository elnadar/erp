// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum WeightUnits { tn, kg, gm, mg, none }

WeightUnits getWeightUnitEnum(String str) {
  str = str.toLowerCase();
  if (str == "tn") {
    return WeightUnits.tn;
  } else if (str == "kg") {
    return WeightUnits.kg;
  } else if (str == "gm") {
    return WeightUnits.gm;
  } else if (str == "mg") {
    return WeightUnits.mg;
  }
  return WeightUnits.none;
}

class MaterialsModel {
  final int? id;
  final String name;
  final WeightUnits? measurement;
  final String? notes;
  final int? supplierId;
  MaterialsModel({
    this.id,
    required this.name,
    this.measurement,
    this.notes,
    this.supplierId,
  });

  MaterialsModel copyWith({
    int? id,
    String? name,
    WeightUnits? measurement,
    String? notes,
    int? supplierId,
  }) {
    return MaterialsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      measurement: measurement ?? this.measurement,
      notes: notes ?? this.notes,
      supplierId: supplierId ?? this.supplierId,
    );
  }

  Map<String, dynamic> toSqlInsert() {
    return <String, dynamic>{
      'name': name == '' ? null : name,
      'measurement': measurement?.name,
      'notes': notes == '' ? null : notes,
      'supplier_id': supplierId,
    };
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'measurement': measurement?.name,
      'notes': notes,
      'supplier_id': supplierId,
    };
  }

  factory MaterialsModel.fromMap(Map<String, dynamic> map) {
    return MaterialsModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      measurement: map['measurement'] != null
          ? getWeightUnitEnum(map['measurement'])
          : null,
      notes: map['notes'] != null ? map['notes'] as String : null,
      supplierId: map['supplier_id'] != null ? map['supplier_id'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MaterialsModel.fromJson(String source) =>
      MaterialsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MaterialsModel(id: $id, name: $name, measurement: $measurement, notes: $notes, supplierId: $supplierId)';
  }

  @override
  bool operator ==(covariant MaterialsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.measurement == measurement &&
        other.notes == notes &&
        other.supplierId == supplierId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        measurement.hashCode ^
        notes.hashCode ^
        supplierId.hashCode;
  }
}
