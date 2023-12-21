import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:staple/models/user_information.dart';

class DbHelper {
  Database? _db;

  Future<Database> get db async {
    //ilka açılan uygulamada database kontrol ediyor
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db!;
  }

  Future<Database> initializeDb() async {
    // database var ise başlatıyor yok ise oluşturuyor
    String dbPath = join(await getDatabasesPath(), "users.db");
    var usersDb = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return usersDb;
  }

  void createDb(Database db, int version) async {
    //uygun alanlar ile database oluşturuyor
    await db.execute(
        'CREATE TABLE userInformation(id INTEGER PRIMARY KEY, name TEXT, surname TEXT,username TEXT,email TEXT,password TEXT)');
    print("tablo oluşturuldu");
  }

  Future<List<UserInformation>> getUserInformation() async {
    //databesadeki verileri listelemeye yarıyor
    Database db = await this.db;
    var result = await db.query("userInformation");
    return List.generate(result.length, (i) {
      return UserInformation.fromObject(result[i]);
    });
  }

  Future<int> insert(UserInformation userInformation) async {
    //ekleme işlemini map yardımıyla yapıyoruz
    Database db = await this.db;
    var result = await db.insert("userInformation", userInformation.toMap());
    print("kullanıcı eklendi");
    return result;
  }

  Future<int> delete(UserInformation userInformation) async {
    //silme işlemi
    Database db = await this.db;
    var result = await db.delete("userInformation",
        where: "id=?", whereArgs: [userInformation.id]);
    return result;
  }

  Future<int> update(UserInformation userInformation) async {
    //güncelleme işlemini map yardımıyla yapıyoruz
    Database db = await this.db;
    var result = await db.update("userInformation", userInformation.toMap(),
        where: "id=?", whereArgs: [userInformation.id]);
    return result;
  }

  Future<bool> loginKontrol(UserInformation userInformation) async {
    final Database db = await this.db;
    var result = await db.rawQuery(
        "select * from userInformation where email='${userInformation.email}' AND password='${userInformation.password}'");
    if (result.isEmpty) {
      return false;
    } else
      return true;
  }
  /*Future<List<String>> getRecentKeywords() async {    bu arama sayfasındaki en son arananlar kısmının kodu
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      tableName,
      orderBy: 'id DESC',
      limit: 5, // İstenilen son 5 kelimeyi alabilirsiniz, istediğiniz sayıyı belirleyebilirsiniz.
    );
    return List.generate(maps.length, (index) => maps[index]['keyword']);
  }*/
}
