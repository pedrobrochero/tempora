import 'dart:async';

import '../../../../core/data/datasources/timers_sqlite_db.dart';
import '../../domain/entities/custom_timer.dart';
import '../models/custom_timer_model.dart';

/// A data source for timers.
abstract class TimersLocalDataSource {
  /// Returns a list of [CustomTimer]s.
  Future<List<CustomTimer>> getTimers();

  /// Creates a new [CustomTimer] in the database.
  Future<void> createTimer(CustomTimer timer);

  /// Deletes a timer with the given [id].
  Future<void> deleteTimer(String id);

  /// Edits a [CustomTimer] in the database.
  Future<void> editTimer(CustomTimer timer);
}

class TimersLocalDataSourceImpl implements TimersLocalDataSource {
  const TimersLocalDataSourceImpl(this.sqliteProvider);

  /// A provider for sqlite database.
  final TimersSqliteProvider sqliteProvider;

  @override
  Future<List<CustomTimer>> getTimers() async {
    final db = await sqliteProvider.database;
    final result = await db.query(TimersTable.tableName);
    return result.map((e) => CustomTimerModel.fromJson(e)).toList();
  }

  @override
  Future<void> createTimer(CustomTimer timer) async {
    final db = await sqliteProvider.database;
    await db.insert(
      TimersTable.tableName,
      CustomTimerModel.fromEntity(timer).toJson(),
    );
  }

  @override
  Future<void> deleteTimer(String id) async {
    final db = await sqliteProvider.database;
    await db.delete(
      TimersTable.tableName,
      where: '${TimersTable.id} = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<void> editTimer(CustomTimer timer) async {
    final db = await sqliteProvider.database;
    await db.update(
      TimersTable.tableName,
      CustomTimerModel.fromEntity(timer).toJson(),
      where: '${TimersTable.id} = ?',
      whereArgs: [timer.id],
    );
  }
}
