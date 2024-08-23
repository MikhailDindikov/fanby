import 'dart:io';

import 'package:fanby/fan_models/fan_datenote.dart';
import 'package:fanby/fan_models/fan_notes.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class FanDBHelper {
  static final _dbHelper = FanDBHelper._createInstance();

  Database? _db = null;

  FanDBHelper._createInstance();

  factory FanDBHelper() {
    return _dbHelper;
  }

  Future<Database> get database async {
    _db ??= await initDb();

    return _db!;
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'te.db');

    var db = await openDatabase(path, version: 1, onCreate: _createDb);
    return db;
  }

  // Если бд нет в директории прилы, то создаем ее
  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE Notes (id INTEGER PRIMARY KEY AUTOINCREMENT, day INTEGER, month INTEGER, year INTEGER, notice TEXT, observe TEXT, breastType INTEGER, noticedType INTEGER, howLong TEXT, constantsType INTEGER, patternts TEXT, periodType INTEGER, period TEXT)');
  }

  Future<int> addNote(FanNotes fanNotes) async {
    Database db = await database;
    int result = await db.insert('Notes', fanNotes.toMap());

    return result;
  }

  Future<List<FanNotes>> getAllNotes(
      String selday, String selMonth, String selYear) async {
    Database db = await database;
    List<Map<String, dynamic>> mapList = await db.query('Notes',
        where: 'day = ? and month = ? and year = ?',
        whereArgs: [selday, selMonth, selYear],
        orderBy: 'id DESC');

    return mapList
        .map((e) => FanNotes.fromMap(e))
        .toList()
        .where((element) => element.notice.isNotEmpty)
        .toList();
  }

  Future<List<FanDatenote>> getAllNotesDate(
      String selMonth, String selYear) async {
    Database db = await database;
    List<Map<String, dynamic>> mapList = await db.query('Notes',
        where: 'month = ? and year = ?',
        columns: ['day', 'notice'],
        whereArgs: [selMonth, selYear],
        orderBy: 'id DESC');

    return mapList.map((e) => FanDatenote.fromMap(e)).toList();
  }
}
