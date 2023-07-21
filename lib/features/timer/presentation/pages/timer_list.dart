import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/control_classes/status.dart';
import '../../../../core/dependency_injection.dart';
import '../../../../core/presentation/widgets/empty_list_component.dart';
import '../../../../generated/l10n.dart';
import '../../domain/usecases/create_timer.dart';
import '../cubit/timer_list_cubit.dart';
import '../widgets/timer_form.dart';
import '../widgets/timer_tile.dart';

@RoutePage()
class TimerListPage extends StatelessWidget {
  const TimerListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timerListCubit = sl<TimerListCubit>();
    return BlocProvider(
      create: (context) => timerListCubit,
      child: Scaffold(
        body: BlocConsumer<TimerListCubit, TimerListState>(
          listener: (context, state) {
            if (state.status is ErrorStatus) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(S.of(context).anErrorHasOcurred)),
              );
            }
          },
          builder: (context, state) {
            final timers = state.timers;
            if (timers.isEmpty) {
              return EmptyListComponent(message: S.of(context).noTimersYet);
            }
            return ListView.builder(
              itemCount: timers.length + 1,
              itemBuilder: (context, index) {
                // Spacer to avoid overlapping with FAB.
                if (index == timers.length) {
                  return const SizedBox(height: 64);
                }
                return TimerTile(
                  cubit: timerListCubit.getTimerCubit(timers[index]),
                  key: ValueKey(timers[index]),
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
                      context.read<TimerListCubit>().createTimer(result);
                    }
                  },
                  child: const Icon(Icons.add_alarm),
                )),
      ),
    );
  }
}
