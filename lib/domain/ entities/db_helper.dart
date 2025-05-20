import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;

  DBHelper._internal();

  static Database? _db;

  Future<Database> get database async {
    return _db ??= await initDB();
  }

  Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'albums_app.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE albums (
        id INTEGER PRIMARY KEY,
        userId INTEGER,
        title TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE photos (
        id INTEGER PRIMARY KEY,
        albumId INTEGER,
        title TEXT,
        url TEXT,
        thumbnailUrl TEXT
      )
    ''');
  }
}
