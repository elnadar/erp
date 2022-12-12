import 'package:erp/utils/database/init.dart';
import 'package:sqflite/sqflite.dart';

import 'material_model.dart';

class DbMaterialsTable {
  static const String _tableName = 'Materials';
  DbMaterialsTable._sharedInstance();
  static final DbMaterialsTable _shared = DbMaterialsTable._sharedInstance();
  factory DbMaterialsTable() => _shared;

  Future<Database> get _db async {
    return await DbProvider().database;
  }

  insert(MaterialModel model) async {
    final db = await _db;
    model.copyWith(id: await db.insert(_tableName, model.toSqlInsert()));
    return model;
  }

  listRows() async {
    final db = await _db;
    List<MaterialModel> materialsList = [];
    List<Map> maps = await db.query(_tableName, columns: MaterialModel.columns);
    if (maps.isNotEmpty) {
      for (final Map<String, dynamic> map
          in maps as List<Map<String, dynamic>>) {
        materialsList.add(MaterialModel.fromMap(map));
      }
      return materialsList;
    }
    return null;
  }

  getMaterial(int id) async {
    final db = await _db;

    List<Map> maps = await db.query(_tableName,
        columns: MaterialModel.columns, where: '_id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return MaterialModel.fromMap(maps.first as Map<String, dynamic>);
    }
    return null;
  }
}
