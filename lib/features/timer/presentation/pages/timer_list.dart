import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injection.dart';
import '../cubit/timer_list_cubit.dart';
import '../widgets/timer_tile.dart';

@RoutePage()
class TimerListPage extends StatelessWidget {
  const TimerListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => sl<TimerListCubit>(),
        child: Scaffold(
          body: BlocBuilder<TimerListCubit, TimerListState>(
            builder: (context, state) {
              final timers = state.timers;
              return ListView.builder(
                itemCount: timers.length,
                itemBuilder: (context, index) =>
                    TimerTile(timer: timers[index]),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add_alarm),
          ),
        ),
      );
}
