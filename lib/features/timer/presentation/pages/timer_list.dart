import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injection.dart';
import '../../domain/usecases/create_timer.dart';
import '../cubit/timer_cubit.dart';
import '../cubit/timer_list_cubit.dart';
import '../widgets/timer_form.dart';
import '../widgets/timer_tile.dart';

@RoutePage()
class TimerListPage extends StatelessWidget {
  const TimerListPage({Key? key}) : super(key: key);

  // TODO(pedrobrochero): Generate and close blocs from TimerListCubit.

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => sl<TimerListCubit>(),
        child: Scaffold(
          body: BlocBuilder<TimerListCubit, TimerListState>(
            builder: (context, state) {
              final timers = state.timers;
              final blocs =
                  timers.map((e) => sl<TimerCubit>(param1: e)).toList();
              return ListView.builder(
                itemCount: timers.length + 1,
                itemBuilder: (context, index) {
                  // Spacer to avoid overlapping with FAB.
                  if (index == timers.length) {
                    return const SizedBox(height: 64);
                  }
                  return TimerTile(
                    cubit: blocs[index],
                    key: ValueKey(timers),
                  );
                },
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
