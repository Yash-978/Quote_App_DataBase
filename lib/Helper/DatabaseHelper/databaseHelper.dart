
import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static final DataBaseHelper dataBaseHelper = DataBaseHelper._singleton();

  DataBaseHelper._singleton();

  String dataBaseName = 'quotes.db';
  String tableName = 'quotesTable';

  Database? _database;

  Future get database async => _database ?? await initDatabase();

  Future initDatabase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, dataBaseName);
    _database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        String sql = '''
        CREATE TABLE $tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        text TEXT NOT NULL,
        author TEXT NOT NULL,
        cate TEXT NOT NULL,
        like TEXT NOT NULL)
        ''';
        return db.execute(sql);
      },
    );
    return _database;
  }

  Future<void> insertQuote(
      Database db, String cate, String text, String author, String like) async {
    Database? db = await database;
    String sql =
        '''INSERT INTO $tableName(cate, id, text, author, like) VALUES (?,NULL,?,?,?)
    ''';
    List args = [cate, text, author, like];
    await db!.rawInsert(sql, args);
  }

  Future readData() async {
    Database? db = await database;
    String sql = '''
    SELECT * FROM $tableName
    ''';
    return await db!.rawQuery(sql);
  }

  Future deleteQuote(String text) async {
    Database? db = await database;
    String sql = '''DELETE FROM $tableName WHERE text=?''';
    return await db!.rawDelete(sql, [text]);
  }

  Future getLikedQuotes() async {
    Database? db = await database;
    return await db!.query(tableName, where: 'like = ?', whereArgs: [1]);
  }

  Future getLikedCategoriesQuotes(String cate) async {
    Database? db = await database;
    return await db!.query(
      tableName,
      where: 'like = ? AND category = ?',
      whereArgs: [1, cate],
    );
  }
}
