import 'dart:io';

import 'package:erp/utils/database/base_code.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DbProvider {
  Database? _database;
  DbProvider._sharedInstance();
  static final DbProvider _shared = DbProvider._sharedInstance();
  factory DbProvider() => _shared;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('sys.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    if (Platform.isAndroid || Platform.isIOS) {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, filePath);
      return openDatabase(path, version: 1, onCreate: _createDB);
    } else {
      var databaseFactory = databaseFactoryFfi;
      var db = await databaseFactory.openDatabase(inMemoryDatabasePath);
      await _createDB(db, 1);
      return db;
    }
  }

  Future listTables() async {
    final db = await database;
    final log =
        await db.rawQuery("SELECT name FROM sqlite_master WHERE type='table'");
    debugPrint(log.toString());
  }

  Future _createDB(Database db, int version) async {
    for (final element in sqlCreateDataBase) {
      await db.execute(element);
      debugPrint("Created");
    }
  }

  Future close() async {
    final db = await database;
    return db.close();
  }
}
