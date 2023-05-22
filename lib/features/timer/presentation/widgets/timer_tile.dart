import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/utils/context_extension.dart';
import '../../domain/entities/timer.dart';
import '../cubit/timer_cubit.dart';

/// A [Widget] that displays a timer.
class TimerTile extends StatelessWidget {
  const TimerTile({
    required this.timer,
    super.key,
  });

  final CustomTimer timer;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => TimerCubit(timer),
        child: BlocBuilder<TimerCubit, TimerState>(
          builder: (context, state) => Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: state.isFinished ? Colors.red : null,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: state.isRunning
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,
                  width: 2),
            ),
            child: ListTile(
                title: Text(
                  timer.name,
                  style: context.textTheme.labelSmall,
                ),
                subtitle: BlocSelector<TimerCubit, TimerState, String>(
                  selector: (state) => state.clockTime,
                  builder: (context, state) => Text(
                    state,
                    style: context.textTheme.displaySmall,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Builder(
                        builder: (context) => IconButton(
                              onPressed: () {
                                context.read<TimerCubit>().resetTimer();
                              },
                              icon: const Icon(Icons.replay),
                            )),
                    BlocSelector<TimerCubit, TimerState, bool>(
                      selector: (state) => state.isRunning,
                      builder: (context, state) =>
                          state ? const StopButton() : const StartButton(),
                    ),
                  ],
                )),
          ),
        ),
      );
}

class StartButton extends StatelessWidget {
  const StartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: () {
          context.read<TimerCubit>().startTimer();
        },
        child: const Icon(Icons.play_arrow),
      );
}

class StopButton extends StatelessWidget {
  const StopButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: () {
          context.read<TimerCubit>().pauseTimer();
        },
        child: BlocSelector<TimerCubit, TimerState, bool>(
          selector: (state) => state.isFinished,
          builder: (context, state) => Icon(state ? Icons.stop : Icons.pause),
        ),
      );
}
