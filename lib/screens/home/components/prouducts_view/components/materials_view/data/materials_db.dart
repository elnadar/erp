import 'package:erp/utils/database/init.dart';
import 'package:sqflite/sqflite.dart';

import 'materials_model.dart';

class DbMaterialsTable {
  static const String _tableName = 'Materials';
  DbMaterialsTable._sharedInstance();
  static final DbMaterialsTable _shared = DbMaterialsTable._sharedInstance();
  factory DbMaterialsTable() => _shared;

  Future<Database> get _db async {
    return await DbProvider().database;
  }

  insert(MaterialsModel model) async {
    final db = await _db;
    model.copyWith(id: await db.insert(_tableName, model.toSqlInsert()));
    return model;
  }

  listRows() async {
    final db = await _db;
    List<MaterialsModel> materialsList = [];
    List<Map> maps =
        await db.query(_tableName, columns: MaterialsModel.columns);
    if (maps.isNotEmpty) {
      for (final Map<String, dynamic> map
          in maps as List<Map<String, dynamic>>) {
        materialsList.add(MaterialsModel.fromMap(map));
      }
      return materialsList;
    }
    return null;
  }

  getSupplier(int id) async {
    final db = await _db;

    List<Map> maps = await db.query(_tableName,
        columns: MaterialsModel.columns, where: '_id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return MaterialsModel.fromMap(maps.first as Map<String, dynamic>);
    }
    return null;
  }
}
