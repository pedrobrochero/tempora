// ignore_for_file: leading_newlines_in_multiline_strings

import 'dart:async';

import 'package:sqflite/sqflite.dart';

import '../providers/sqlite_provider.dart';

class TimersSqliteProvider extends SqliteProvider {
  @override
  String get dbName => SqliteProvider.timersDb;

  @override
  int get dbVersion => 2;

  @override
  FutureOr<void> onCreate(Database db, int version) async {
    await db.execute(TimersTable._creationQuery);
  }

  @override
  FutureOr<void> onUpgrade(Database db, int currentV, int newV) async {
    if (currentV <= 1 && newV >= 2) {
      await db.transaction((txn) async {
        for (final query in TimersTable._upgradeQuery1) {
          await txn.execute(query);
        }
      });
    }
  }
}

class TimersTable {
  static const tableName = 'timers';
  static const id = 'id';
  static const name = 'name';
  static const duration = 'duration';
  static const timesStarted = 'timesStarted';
  static const isFavorite = 'isFavorite';

  static const _creationQuery = 'CREATE TABLE $tableName( '
      '$id TEXT NOT NULL PRIMARY KEY, '
      '$name TEXT NOT NULL, '
      '$duration INTEGER NOT NULL, '
      '$timesStarted INTEGER NOT NULL DEFAULT 0, '
      '$isFavorite INTEGER NOT NULL DEFAULT 0 '
      ')';

  static const _upgradeQuery1 = [
    'CREATE TABLE temp AS SELECT $id, $name, $duration FROM $tableName',
    'DROP TABLE $tableName',
    '''CREATE TABLE $tableName( 
    $id TEXT NOT NULL PRIMARY KEY, 
    $name TEXT NOT NULL, 
    $duration INTEGER NOT NULL, 
    $timesStarted INTEGER NOT NULL DEFAULT 0, 
    $isFavorite INTEGER NOT NULL DEFAULT 0 )''',
    '''INSERT INTO $tableName( $id, $name, $duration ) 
    SELECT $id, $name, $duration FROM temp ''',
    'DROP TABLE temp',
  ];
}

// TODO(pedrobrochero): Add created_at field.