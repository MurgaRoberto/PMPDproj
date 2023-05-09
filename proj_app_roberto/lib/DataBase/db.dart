import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:proj_app_roberto/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> _openDB() async{
    return openDatabase(join(await getDatabasesPath(), 'users.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users (id INTEGER PRIMRY KEY AUTO INCREMENT, nombreUser TEXT, nombre TEXT, apellido1 TEXT, apellido2 TEXT, eMail TEXT)',
        );
      }, version: 1);
  }


  static Future<void> insert(User user) async {
    Database database = await _openDB();

    database.insert("users", user.toMap());
  }

  static Future<void> delete(User user) async {
    Database database = await _openDB();

    database.delete("users", where: "id = ?", whereArgs: [user.id]);
  }

  static Future<void> update(User user) async {
    Database database = await _openDB();

    database.update("users", user.toMap(), where: "id = ?", whereArgs: [user.id]);
  }


  static Future<List<User>> usuarios() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> usersMap = await database.query("users");

    return List.generate(usersMap.length,
      (i) => User(
        id: usersMap[i]['id'],
        nombreUser: usersMap[i]['nombreUser'],
        nombre: usersMap[i]['nombre'],
        apellido1: usersMap[i]['apellido1'],
        apellido2: usersMap[i]['apellido2'],
        eMail: usersMap[i]['eMail']));
  }
  
}