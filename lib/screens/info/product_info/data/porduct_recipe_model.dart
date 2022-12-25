// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductsRecipeModel {
  // _id         INTEGER NOT NULL UNIQUE,
  // material_id INTEGER NOT NULL,
  // product_id  INTEGER NOT NULL,
  // quantity    FLOAT   NOT NULL,
  final int? id;
  final int materialId;
  final int productId;
  final double quantity;
  ProductsRecipeModel({
    this.id,
    required this.materialId,
    required this.productId,
    required this.quantity,
  });

  ProductsRecipeModel copyWith({
    int? id,
    int? materialId,
    int? productId,
    double? quantity,
  }) {
    return ProductsRecipeModel(
      id: id ?? this.id,
      materialId: materialId ?? this.materialId,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toSqlInsert() {
    return <String, dynamic>{
      'material_id': materialId,
      'product_id': productId,
      'quantity': quantity,
    };
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'material_id': materialId,
      'product_id': productId,
      'quantity': quantity,
    };
  }

  factory ProductsRecipeModel.fromMap(Map<String, dynamic> map) {
    return ProductsRecipeModel(
      id: map['_id'] != null ? map['_id'] as int : null,
      materialId: map['material_id'] as int,
      productId: map['product_id'] as int,
      quantity: map['quantity'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsRecipeModel.fromJson(String source) =>
      ProductsRecipeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductsRecipeModel(id: $id, material_id: $materialId, product_id: $productId, quantity: $quantity)';
  }

  @override
  bool operator ==(covariant ProductsRecipeModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.materialId == materialId &&
        other.productId == productId &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        materialId.hashCode ^
        productId.hashCode ^
        quantity.hashCode;
  }
}
