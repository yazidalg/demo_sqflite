import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DbHelper {
  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'users.db';
    var todoDb = await openDatabase(path, version: 1, onCreate: _createDb);
    return todoDb;
  }

  _createDb(Database db, int version) async {
    await db.execute('''
    CREATE TABLE users
    (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    email TEXT,
    phone TEXT,
    password TEXT,
    bio TEXT
    )
    ''');
  }
}
