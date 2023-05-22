import 'dart:async';

import 'package:sqflite/sqflite.dart';

import '../providers/sqlite_provider.dart';

class TimersSqliteProvider extends SqliteProvider {
  @override
  String get dbName => SqliteProvider.timersDb;

  @override
  int get dbVersion => 1;

  @override
  FutureOr<void> onCreate(Database db, int version) async {
    await db.execute(TimersTable._creationQuery);
  }

  @override
  FutureOr<void> onUpgrade(Database db, int currentV, int newV) {}
}

class TimersTable {
  static const tableName = 'timers';
  static const id = 'id';
  static const name = 'name';
  static const duration = 'duration';

  static const _creationQuery = 'CREATE TABLE $tableName( '
      '$id TEXT NOT NULL PRIMARY KEY, '
      '$name TEXT NOT NULL, '
      '$duration INTEGER NOT NULL '
      ')';
}
