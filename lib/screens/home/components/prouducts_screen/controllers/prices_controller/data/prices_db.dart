import 'package:erp/utils/database/init.dart';
import 'package:sqflite/sqflite.dart';

import 'price_model.dart';

enum PricesType { product, material }

class DbPricesTable {
  static const String _tableName = 'Prices';
  DbPricesTable._sharedInstance();
  static final DbPricesTable _shared = DbPricesTable._sharedInstance();
  factory DbPricesTable() => _shared;

  Future<Database> get _db async {
    return await DbProvider().database;
  }

  insert(PriceModel model) async {
    final db = await _db;
    model.copyWith(id: await db.insert(_tableName, model.toSqlInsert()));
    return model;
  }

  listRows() async {
    final db = await _db;
    List<PriceModel> pricesList = [];
    List<Map> maps = await db.query(_tableName, columns: PriceModel.columns);
    if (maps.isNotEmpty) {
      for (final Map<String, dynamic> map
          in maps as List<Map<String, dynamic>>) {
        pricesList.add(PriceModel.fromMap(map));
      }
      return pricesList;
    }
    return null;
  }

  getByType(PricesType type) async {
    final db = await _db;

    List<Map> maps = await db.query(_tableName,
        columns: PriceModel.columns,
        where: '${type.name}_id != ?',
        whereArgs: [null]);
    if (maps.isNotEmpty) {
      return PriceModel.fromMap(maps.first as Map<String, dynamic>);
    }
    return null;
  }

  getByTypeAndId(PricesType type, int typeId, {bool asc = false}) async {
    final db = await _db;
    List<PriceModel> pricesList = [];
    List<Map> maps = await db.query(_tableName,
        columns: PriceModel.columns,
        where: '${type.name}_id = ?',
        whereArgs: [typeId],
        orderBy: 'date ${asc ? '' : 'DESC'}');
    if (maps.isNotEmpty) {
      for (final Map<String, dynamic> map
          in maps as List<Map<String, dynamic>>) {
        pricesList.add(PriceModel.fromMap(map));
      }
      return pricesList;
    }
    return null;
  }

  getPrice(int id) async {
    final db = await _db;

    List<Map> maps = await db.query(_tableName,
        columns: PriceModel.columns, where: '_id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return PriceModel.fromMap(maps.first as Map<String, dynamic>);
    }
    return null;
  }
}
