import 'package:erp/utils/database/init.dart';
import 'package:sqflite/sqflite.dart';

import 'porduct_recipe_model.dart';
import 'product_recipe_with_prices_model.dart';

class DbProductRecipesTable {
  static const String _tableName = 'ProductRecipes';
  DbProductRecipesTable._sharedInstance();
  static final DbProductRecipesTable _shared =
      DbProductRecipesTable._sharedInstance();
  factory DbProductRecipesTable() => _shared;

  Future<Database> get _db async {
    return await DbProvider().database;
  }

  insert(ProductRecipeModel model) async {
    final db = await _db;
    model.copyWith(id: await db.insert(_tableName, model.toSqlInsert()));
    return model;
  }

  listRows() async {
    final db = await _db;
    List<ProductRecipeModel> productRecipesList = [];
    List<Map> maps =
        await db.query(_tableName, columns: ProductRecipeModel.columns);
    if (maps.isNotEmpty) {
      for (final Map<String, dynamic> map
          in maps as List<Map<String, dynamic>>) {
        productRecipesList.add(ProductRecipeModel.fromMap(map));
      }
      return productRecipesList;
    }
    return null;
  }

  getByMaterialId(int id) async {
    final db = await _db;
    List<ProductRecipeModel> productRecipesList = [];
    List<Map> maps = await db.query(_tableName,
        columns: ProductRecipeModel.columns,
        where: 'material_id = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      for (final Map<String, dynamic> map
          in maps as List<Map<String, dynamic>>) {
        productRecipesList.add(ProductRecipeModel.fromMap(map));
      }
      return productRecipesList;
    }
    return null;
  }

  getPricesByMaterialId(int id) async {
    final db = await _db;
    List<ProductRecipeWithPriceModel> productRecipesList = [];
    List<Map> maps = await db.rawQuery('''
        SELECT f.material_id AS material_id, product_id,
            t.name as name, MAX(date) as date, price,
            f.quantity as product_quantity,
            t.quantity as material_quantity, measurement
        FROM $_tableName AS f
        INNER JOIN Prices AS s
        USING (product_id)
        WHERE f.material_id = ?
        GROUP BY product_id
        INNER JOIN Materials as t
        ON product_id = t._id
      ''', [id]);
    if (maps.isNotEmpty) {
      for (final Map<String, dynamic> map
          in maps as List<Map<String, dynamic>>) {
        productRecipesList.add(ProductRecipeWithPriceModel.fromMap(map));
      }
      return productRecipesList;
    }
    return null;
  }

  getProductRecipe(int id) async {
    final db = await _db;

    List<Map> maps = await db.query(_tableName,
        columns: ProductRecipeModel.columns, where: '_id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return ProductRecipeModel.fromMap(maps.first as Map<String, dynamic>);
    }
    return null;
  }
}
