import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class SqliteProvider {
  /// Database names.
  ///
  /// All db names should be listed here to avoid name collission.
  static const timersDb = 'timersDb';

  /// Database name. Define it in parent abstract class static to avoid
  /// name-collision.
  String get dbName;

  /// Database version. Increment this when you change the schema.
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
      onCreate: onCreate,
      onUpgrade: onUpgrade,
    );
    return _database!;
  }

  FutureOr<void> onCreate(Database db, int version);

  /// Use this conditional structure
  /// if (currentV <= 1 && newV >= 2) { }
  FutureOr<void> onUpgrade(Database db, int currentV, int newV);

  Future<List<Map<String, Object?>>> Function(String table,
      {List<String>? columns,
      bool? distinct,
      String? groupBy,
      String? having,
      int? limit,
      int? offset,
      String? orderBy,
      String? where,
      List<Object?>? whereArgs})? get query => _database?.query;
}
