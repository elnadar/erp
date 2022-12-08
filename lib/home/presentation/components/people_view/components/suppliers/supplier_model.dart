import 'dart:convert';

class SupplierModel {
  final int? id;
  final String name;
  final String? phoneNumber;
  final String? address;
  final String? note;
  SupplierModel({
    this.id,
    required this.name,
    this.phoneNumber,
    this.address,
    this.note,
  });

  static List<String> get columns =>
      ['id', 'name', 'phone_number', 'address', 'note'];

  SupplierModel copyWith({
    int? id,
    String? name,
    String? phoneNumber,
    String? address,
    String? note,
  }) {
    return SupplierModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone_number': phoneNumber,
      'address': address,
      'note': note,
    };
  }

  Map<String, dynamic> toSqlInsert() {
    return <String, dynamic>{
      'name': name,
      'phone_number': phoneNumber,
      'address': address,
      'note': note,
    };
  }

  factory SupplierModel.fromMap(Map<String, dynamic> map) {
    return SupplierModel(
      id: map['id'] as int,
      name: map['name'] as String,
      phoneNumber:
          map['phone_number'] != null ? map['phone_number'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      note: map['note'] != null ? map['note'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SupplierModel.fromJson(String source) =>
      SupplierModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SupplierModel(id: $id, name: $name, phoneNumber: $phoneNumber, address: $address, note: $note)';
  }

  @override
  bool operator ==(covariant SupplierModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.phoneNumber == phoneNumber &&
        other.address == address &&
        other.note == note;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phoneNumber.hashCode ^
        address.hashCode ^
        note.hashCode;
  }
}
