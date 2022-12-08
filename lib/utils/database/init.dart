import 'package:erp/utils/database/base_code.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbProvider {
  Database? _database;
  DbProvider._sharedInstance();
  static final DbProvider _shared = DbProvider._sharedInstance();
  factory DbProvider() => _shared;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute(sqlCreateDataBase);
  }
}
