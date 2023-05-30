import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injection.dart';
import '../../domain/usecases/create_timer.dart';
import '../cubit/timer_list_cubit.dart';
import '../widgets/timer_form.dart';
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
                itemBuilder: (context, index) => TimerTile(
                  timer: timers[index],
                  key: Key(timers[index].id),
                ),
              );
            },
          ),
          floatingActionButton: Builder(
              builder: (context) => FloatingActionButton(
                    onPressed: () async {
                      final result = await showCreateTimerForm(context);
                      if (result is CreateTimerParams) {
                        context
                            .read<TimerListCubit>()
                            .createTimerAction(result);
                      }
                    },
                    child: const Icon(Icons.add_alarm),
                  )),
        ),
      );
}
