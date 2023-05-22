import 'dart:async';

import '../../../../core/data/datasources/timers_sqlite_db.dart';
import '../../domain/entities/timer.dart';
import '../models/custom_timer_model.dart';

/// A data source for timers.
abstract class TimersLocalDataSource {
  Future<List<CustomTimer>> getTimers();
  Future<void> createTimer(CustomTimer timer);
}

class TimersLocalDataSourceImpl implements TimersLocalDataSource {
  const TimersLocalDataSourceImpl(this.sqliteProvider);

  /// A provider for sqlite database.
  final TimersSqliteProvider sqliteProvider;

  @override
  Future<List<CustomTimer>> getTimers() async {
    final db = await sqliteProvider.database;
    final result = await db.query(TimersTable.name);
    return result.map((e) => CustomTimerModel.fromJson(e)).toList();
  }

  @override
  Future<void> createTimer(CustomTimer timer) async {
    final db = await sqliteProvider.database;
    await db.insert(
      TimersTable.name,
      CustomTimerModel.fromEntity(timer).toJson(),
    );
  }
}
