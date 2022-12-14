import 'package:erp/utils/database/init.dart';
import 'package:sqflite/sqflite.dart';

import 'product_model.dart';

class DbProductsTable {
  static const String _tableName = 'Products';
  DbProductsTable._sharedInstance();
  static final DbProductsTable _shared = DbProductsTable._sharedInstance();
  factory DbProductsTable() => _shared;

  Future<Database> get _db async {
    return await DbProvider().database;
  }

  insert(ProductModel model) async {
    final db = await _db;
    model.copyWith(id: await db.insert(_tableName, model.toSqlInsert()));
    return model;
  }

  listRows() async {
    final db = await _db;
    List<ProductModel> productsList = [];
    List<Map> maps = await db.query(_tableName, columns: ProductModel.columns);
    if (maps.isNotEmpty) {
      for (final Map<String, dynamic> map
          in maps as List<Map<String, dynamic>>) {
        productsList.add(ProductModel.fromMap(map));
      }
      return productsList;
    }
    return null;
  }

  getProduct(int id) async {
    final db = await _db;

    List<Map> maps = await db.query(_tableName,
        columns: ProductModel.columns, where: '_id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return ProductModel.fromMap(maps.first as Map<String, dynamic>);
    }
    return null;
  }
}
