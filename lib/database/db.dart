import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../model/time.dart';
import '../repository/times_repostiory.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:brasileirao/page/home_page.dart';

class DB {
  DB._();

  static final DB instance = DB._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    return _database ??= await initDatabase();
  }

  static get() async {
    return await DB.instance.database;
  }

  initDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), 'banco.db'),
        version: 1, onCreate: ((db, version) async {
      await db.execute(times);
      await db.execute(titulos);
      await setupTimes(db);
    }));
  }

  setupTimes(db) {
    for (Time time in TimesRepository.setupTimes()) {
      db.insert('times', {
        'nome': time.nome,
        'brasao': time.brasao,
        'pontos': time.pontos,
        'cor': time.cor.toString().replaceAll('Color(', '').replaceAll(')', '')
      });
    }
  }

  String get times => ''' 
    CREATE TABLE times(
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      nome TEXT, 
      pontos INTEGER,
      brasao TEXT, 
      cor TEXT
    );
  
  ''';
  String get titulos => ''' 
    CREATE TABLE titulos(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      campeonato TEXT,
      ano INTEGER,      
      time_id INTEGER,
      FOREIGN KEY(time_id) REFERENCES times(id) ON DELETE CASCADE
    );
  ''';
}
