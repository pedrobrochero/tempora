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
  static const name = 'timers';
  static const colId = 'id';
  static const colName = 'name';
  static const colDuration = 'duration';

  static const _creationQuery = 'CREATE TABLE $name( '
      '$colId TEXT NOT NULL PRIMARY KEY, '
      '$colName TEXT NOT NULL, '
      '$colDuration INTEGER NOT NULL '
      ')';
}
