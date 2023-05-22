import 'package:faker/faker.dart';

import '../../domain/entities/timer.dart';
import 'timers_local_data_source.dart';

/// A fake implementation of [TimersLocalDataSource].
class FakeTimersLocalDataSource implements TimersLocalDataSource {
  final faker = Faker();
  @override
  Future<List<CustomTimer>> getTimers() async {
    await Future.delayed(const Duration(seconds: 1));
    return List.generate(
      faker.randomGenerator.integer(10),
      (_) => fakeTimer,
    );
  }

  @override
  Future<void> createTimer(CustomTimer timer) {
    // TODO: implement createTimer
    throw UnimplementedError();
  }
}

CustomTimer get fakeTimer => CustomTimer(
    id: faker.guid.guid(),
    name: faker.food.dish(),
    duration: Duration(
      seconds: faker.randomGenerator.integer(60) + 1,
    ));
