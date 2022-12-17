// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  final int? id;
  final String name;
  final String? notes;
  ProductModel({
    this.id,
    required this.name,
    this.notes,
  });

  static List<String> get columns => [
        '_id',
        'name',
        'notes',
      ];

  ProductModel copyWith({
    int? id,
    String? name,
    String? notes,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toSqlInsert() {
    return <String, dynamic>{
      'name': name == '' ? null : name,
      'notes': notes == '' ? null : notes,
    };
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'notes': notes,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['_id'] != null ? map['_id'] as int : null,
      name: map['name'] as String,
      notes: map['notes'] != null ? map['notes'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductModel(id: $id, name: $name, notes: $notes)';

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.notes == notes;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ notes.hashCode;
}
