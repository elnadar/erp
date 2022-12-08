import 'dart:convert';

class SupplierModel {
  final int? id;
  final String name;
  final String? phoneNumber;
  final String? address;
  final String? notes;
  SupplierModel({
    this.id,
    required this.name,
    this.phoneNumber,
    this.address,
    this.notes,
  });

  static List<String> get columns =>
      ['_id', 'name', 'phone_number', 'address', 'notes'];

  SupplierModel copyWith({
    int? id,
    String? name,
    String? phoneNumber,
    String? address,
    String? notes,
  }) {
    return SupplierModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'phone_number': phoneNumber,
      'address': address,
      'notes': notes,
    };
  }

  Map<String, dynamic> toSqlInsert() {
    return <String, dynamic>{
      'name': name == '' ? null : name,
      'phone_number': phoneNumber == '' ? null : phoneNumber,
      'address': address == '' ? null : address,
      'notes': notes == '' ? null : notes,
    };
  }

  factory SupplierModel.fromMap(Map<String, dynamic> map) {
    return SupplierModel(
      id: map['_id'] as int,
      name: map['name'] as String,
      phoneNumber:
          map['phone_number'] != null ? map['phone_number'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      notes: map['notes'] != null ? map['notes'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SupplierModel.fromJson(String source) =>
      SupplierModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SupplierModel(id: $id, name: $name, phoneNumber: $phoneNumber, address: $address, notes: $notes)';
  }

  @override
  bool operator ==(covariant SupplierModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.phoneNumber == phoneNumber &&
        other.address == address &&
        other.notes == notes;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phoneNumber.hashCode ^
        address.hashCode ^
        notes.hashCode;
  }
}
