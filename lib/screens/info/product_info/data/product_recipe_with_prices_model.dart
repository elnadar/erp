// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:erp/screens/home/components/prouducts_screen/components/materials_view/data/material_model.dart';

class ProductRecipeWithPriceModel {
  // f.material_id AS material_id, product_id,
  // t.name as name, MAX(date) as date, price,
  // f.quantity as product_quantity,
  // t.quantity as material_quantity, measurement

  final int materialId;
  final int productId;
  final String name;
  final DateTime date;
  final double price;
  final double productQuantity;
  final double materialQuantity;
  final WeightUnits measurement;
  ProductRecipeWithPriceModel({
    required this.materialId,
    required this.productId,
    required this.name,
    required this.date,
    required this.price,
    required this.productQuantity,
    required this.materialQuantity,
    required this.measurement,
  });

  ProductRecipeWithPriceModel copyWith({
    int? materialId,
    int? productId,
    String? name,
    DateTime? date,
    double? price,
    double? productQuantity,
    double? materialQuantity,
    WeightUnits? measurement,
  }) {
    return ProductRecipeWithPriceModel(
      materialId: materialId ?? this.materialId,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      date: date ?? this.date,
      price: price ?? this.price,
      productQuantity: productQuantity ?? this.productQuantity,
      materialQuantity: materialQuantity ?? this.materialQuantity,
      measurement: measurement ?? this.measurement,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'material_id': materialId,
      'product_id': productId,
      'name': name,
      'date': date.toString(),
      'price': price,
      'product_quantity': productQuantity,
      'material_quantity': materialQuantity,
      'measurement': measurement.name,
    };
  }

  factory ProductRecipeWithPriceModel.fromMap(Map<String, dynamic> map) {
    return ProductRecipeWithPriceModel(
      materialId: map['material_id'] as int,
      productId: map['product_id'] as int,
      name: map['name'] as String,
      date: DateTime.parse(map['date']),
      price: map['price'] as double,
      productQuantity: map['product_quantity'] as double,
      materialQuantity: map['material_quantity'] as double,
      measurement: getWeightUnitEnum(map['measurement']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductRecipeWithPriceModel.fromJson(String source) =>
      ProductRecipeWithPriceModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductRecipeWithPriceModel(materialId: $materialId, productId: $productId, name: $name, date: $date, price: $price, productQuantity: $productQuantity, materialQuantity: $materialQuantity, measurement: $measurement)';
  }

  @override
  bool operator ==(covariant ProductRecipeWithPriceModel other) {
    if (identical(this, other)) return true;

    return other.materialId == materialId &&
        other.productId == productId &&
        other.name == name &&
        other.date == date &&
        other.price == price &&
        other.productQuantity == productQuantity &&
        other.materialQuantity == materialQuantity &&
        other.measurement == measurement;
  }

  @override
  int get hashCode {
    return materialId.hashCode ^
        productId.hashCode ^
        name.hashCode ^
        date.hashCode ^
        price.hashCode ^
        productQuantity.hashCode ^
        materialQuantity.hashCode ^
        measurement.hashCode;
  }
}
