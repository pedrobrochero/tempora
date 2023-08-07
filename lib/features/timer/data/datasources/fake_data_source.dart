import 'package:faker/faker.dart';

import '../../domain/entities/custom_timer.dart';

// TODO(pedrobrochero): Remove this faker file.

CustomTimer get fakeTimer => CustomTimer(
      id: faker.guid.guid(),
      name: faker.food.dish(),
      duration: Duration(seconds: faker.randomGenerator.integer(60) + 1),
      isFavorite: faker.randomGenerator.boolean(),
      timesStarted: faker.randomGenerator.integer(10),
    );
