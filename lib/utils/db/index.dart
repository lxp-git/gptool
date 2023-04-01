import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

const currentDatabaseVersion = 1;

class AppDatabase {
  late Database db;
  static final AppDatabase _instance = AppDatabase._internal();
  AppDatabase._internal();
  factory AppDatabase() => _instance;
  Future<void> open() async {
    if (kIsWeb) {
      databaseFactory = databaseFactoryFfiWeb;
    } else if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }
    String path = join(await getDatabasesPath(), "database.db");
    db = await databaseFactory.openDatabase(path,
        options: OpenDatabaseOptions(
            version: currentDatabaseVersion,
            onCreate: (Database db, int version) async {
              await db.execute('''
                create table message (
                  id integer primary key autoincrement, 
                  content text,
                  userId text,
                  conversationId integer,
                  extra text,
                  createdAt text)
                ''');
              await db.execute('''
                create table conversation (
                  id integer primary key autoincrement, 
                  title text,
                  createdAt text)
                ''');
            },
            onUpgrade: (db, oldVersion, newVersion) async {}));
  }

  Future close() async => db.close();
}
