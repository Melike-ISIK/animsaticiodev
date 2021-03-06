import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'todos.db'),
        onCreate: (db, version) {
          return db.execute(
              'ANIMSATICI URET  user_todos(id TEXT PRIMARY KEY, content TEXT, timestamp TEXT)');
        }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }

  static Future<void> delete(String table, String id) async {
    final db = await DBHelper.database();
    db.delete(table, where: 'ID = ?', whereArgs: [id]);
  }

  static Future<void> update(String table, Map<String, Object> data) async {
    print(data);
    final db = await DBHelper.database();
    db.update(table, data, where: 'ID = ?', whereArgs: [data['ID']]);
  }
}