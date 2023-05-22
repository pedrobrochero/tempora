import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class SqliteProvider {
  static const someDb = 'someDb';

  /// Get this from the parent class static property to avoid name-collision
  String get dbName;
  int get dbVersion;

  // Lazy initialization
  Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    final path = join(await getDatabasesPath(), '$dbName.db');
    _database = await openDatabase(
      path,
      version: dbVersion,
      onOpen: (_) {},
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
    return _database!;
  }

  /// Use this conditional structure
  /// if (version == 1) { }
  FutureOr<void> _onCreate(Database db, int version) {
    if (version == 1) {
      db.execute(LogsTable._creationQuery);
    }
  }

  /// Use this conditional structure
  /// if (currentV <= 1 && newV >= 2) { }
  FutureOr<void> _onUpgrade(Database db, int currentV, int newV);

  // Copy-pasted methods from plugin, using the lazy initialization for the database
  Future<int> insert(String table, Map<String, Object?> values,
          {ConflictAlgorithm? conflictAlgorithm,
          String? nullColumnHack}) async =>
      (await database).insert(table, values,
          conflictAlgorithm: conflictAlgorithm, nullColumnHack: nullColumnHack);

  Future<List<Map<String, Object?>>> query(String table,
          {List<String>? columns,
          bool? distinct,
          String? groupBy,
          String? having,
          int? limit,
          int? offset,
          String? orderBy,
          String? where,
          List<Object?>? whereArgs}) async =>
      (await database).query(table,
          columns: columns,
          distinct: distinct,
          groupBy: groupBy,
          having: having,
          limit: limit,
          offset: offset,
          orderBy: orderBy,
          where: where,
          whereArgs: whereArgs);

  Future<int> rawUpdate(String sql, [List<Object?>? arguments]) async =>
      (await database).rawUpdate(sql, arguments);

  Future<T> transaction<T>(Future<T> Function(Transaction txn) action,
          {bool? exclusive}) async =>
      (await database).transaction(action, exclusive: exclusive);

  Future<int> update(String table, Map<String, Object?> values,
          {String? where,
          List<Object?>? whereArgs,
          ConflictAlgorithm? conflictAlgorithm}) async =>
      (await database).update(table, values,
          where: where,
          whereArgs: whereArgs,
          conflictAlgorithm: conflictAlgorithm);

  Future<int> delete(String table,
          {String? where, List<Object?>? whereArgs}) async =>
      (await database).delete(table, where: where, whereArgs: whereArgs);
}

class LogsTable {
  const LogsTable();
  static const name = 'logs';
  static const colLog = 'log';
  static const colCreatedAt = 'createdAt';

  static const _creationQuery = 'CREATE TABLE $name( '
      '$colLog TEXT NOT NULL, '
      '$colCreatedAt INTEGER NOT NULL '
      ')';
}
