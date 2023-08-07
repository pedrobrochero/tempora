import 'dart:async';

import '../../../../core/data/datasources/timers_sqlite_db.dart';
import '../../domain/entities/custom_timer.dart';
import '../../domain/usecases/create_timer.dart';
import '../../domain/usecases/edit_timer.dart';
import '../models/custom_timer_model.dart';

/// A data source for timers.
abstract class TimersLocalDataSource {
  /// Returns a list of [CustomTimer]s.
  Future<List<CustomTimer>> getTimers();

  /// Creates a new [CustomTimer] in the database.
  Future<void> createTimer({
    required String id,
    required CreateTimerParams params,
  });

  /// Deletes a timer with the given [id].
  Future<void> deleteTimer(String id);

  /// Edits a [CustomTimer] in the database.
  Future<void> editTimer(EditTimerParams params);
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
  Future<void> createTimer({
    required String id,
    required CreateTimerParams params,
  }) async {
    final db = await sqliteProvider.database;
    final model = CustomTimerModel(
      id: id,
      name: params.name,
      duration: params.duration,
    );
    await db.insert(
      TimersTable.tableName,
      model.toJson(),
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
  Future<void> editTimer(EditTimerParams params) async {
    final db = await sqliteProvider.database;
    // Using the model to convert duration and bool to json.
    final jsonModel = CustomTimerModel(
      id: params.id,
      name: params.name ?? '',
      duration: params.duration ?? Duration.zero,
      isFavorite: params.isFavorite ?? false,
      timesStarted: params.timesStarted ?? 0,
    ).toJson();
    await db.update(
      TimersTable.tableName,
      {
        if (params.name != null) TimersTable.name: params.name,
        if (params.duration != null)
          TimersTable.duration: jsonModel['duration'],
        if (params.isFavorite != null)
          TimersTable.isFavorite: jsonModel['isFavorite'],
        if (params.timesStarted != null)
          TimersTable.timesStarted: params.timesStarted,
      },
      where: '${TimersTable.id} = ?',
      whereArgs: [params.id],
    );
  }
}
