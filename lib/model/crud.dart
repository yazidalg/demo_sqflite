import 'package:demo_sqflite/db/db_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:demo_sqflite/model/users_model.dart';

class CRUD {
  DbHelper dbHelper = DbHelper();

  Future<int> insertUser(Users users) async {
    Database db = await dbHelper.initDb();
    int result = await db.insert('users', users.toMap());
    return result;
  }

  Future<int> updateUser(Users users) async {
    Database db = await dbHelper.initDb();
    int result = await db
        .update('users', users.toMap(), where: "id=?", whereArgs: [users.id]);
    return result;
  }

  Future<List<Users>> getUserList() async {
    Database db = await dbHelper.initDb();
    List<Map<String, dynamic>> mapList =
        await db.query('users', orderBy: 'name');
    int count = mapList.length;
    List<Users> userList = List<Users>();
    for (int y = 0; y < count; y++) {
      userList.add(Users.fromMap(mapList[y]));
    }
    return userList;
  }
}
