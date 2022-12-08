import 'package:erp/home/presentation/components/people_view/components/suppliers/supplier_model.dart';
import 'package:erp/utils/database/init.dart';
import 'package:sqflite/sqflite.dart';

class DbSupplierTable {
  static const String _tableName = 'Suppliers';
  DbSupplierTable._sharedInstance();
  static final DbSupplierTable _shared = DbSupplierTable._sharedInstance();
  factory DbSupplierTable() => _shared;

  Future<Database> get _db async {
    return await DbProvider().database;
  }

  insert(SupplierModel model) async {
    final db = await _db;
    model.copyWith(id: await db.insert(_tableName, model.toSqlInsert()));
    return model;
  }

  getSupplier(int id) async {
    final db = await _db;

    List<Map> maps = await db.query(_tableName,
        columns: SupplierModel.columns, where: 'id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return SupplierModel.fromMap(maps.first as Map<String, dynamic>);
    }
    return null;
  }
}
