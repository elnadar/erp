// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PriceModel {
  // _id         INTEGER  NOT NULL UNIQUE,
  // product_id  INTEGER  NULL    ,
  // material_id INTEGER  NULL    ,
  // date        DATETIME NOT NULL,
  // price       FLOAT    NOT NULL,
  // PRIMARY KEY (_id AUTOINCREMENT),
  // FOREIGN KEY (product_id) REFERENCES Products (_id),
  // FOREIGN KEY (material_id) REFERENCES Materials (_id)

  final int? id;
  final int? productId;
  final int? materialId;
  final DateTime? date;
  final double price;
  PriceModel({
    this.id,
    this.productId,
    this.materialId,
    required this.date,
    required this.price,
  }) : assert((productId != null && materialId == null) ||
            (productId == null && materialId != null));

  static const List<String> columns = [
    '_id',
    'product_id',
    'material_id',
    'date',
    'price'
  ];

  PriceModel copyWith({
    int? id,
    int? productId,
    int? materialId,
    DateTime? date,
    double? price,
  }) {
    return PriceModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      materialId: materialId ?? this.materialId,
      date: date ?? this.date,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toSqlInsert() {
    return <String, dynamic>{
      'product_id': productId,
      'material_id': materialId,
      'date': date.toString(),
      'price': price,
    };
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'product_id': productId,
      'material_id': materialId,
      'date': date.toString(),
      'price': price,
    };
  }

  factory PriceModel.fromMap(Map<String, dynamic> map) {
    return PriceModel(
      id: map['_id'] != null ? map['_id'] as int : null,
      productId: map['product_id'] != null ? map['product_id'] as int : null,
      materialId: map['material_id'] != null ? map['material_id'] as int : null,
      date: DateTime.parse(map['date']),
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory PriceModel.fromJson(String source) =>
      PriceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PriceModel(id: $id, product_id: $productId, material_id: $materialId, date: $date, price: $price)';
  }

  @override
  bool operator ==(covariant PriceModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.productId == productId &&
        other.materialId == materialId &&
        other.date == date &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        productId.hashCode ^
        materialId.hashCode ^
        date.hashCode ^
        price.hashCode;
  }
}
