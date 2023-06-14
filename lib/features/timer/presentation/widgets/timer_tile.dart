import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injection.dart';
import '../../../../core/presentation/utils/context_extension.dart';
import '../../../../core/presentation/widgets/confirm_dialog_component.dart';
import '../../../../generated/l10n.dart';
import '../../../foreground_service/presentation/cubit/foreground_service_cubit.dart';
import '../../domain/entities/timer.dart';
import '../cubit/timer_cubit.dart';
import '../cubit/timer_list_cubit.dart';

/// A [Widget] that displays a timer.
class TimerTile extends StatelessWidget {
  const TimerTile({
    required this.timer,
    super.key,
  });

  final CustomTimer timer;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => sl<TimerCubit>(param1: timer),
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
                  _ResetButton(timer),
                  BlocSelector<TimerCubit, TimerState, bool>(
                    selector: (state) => state.isRunning,
                    builder: (context, state) =>
                        state ? _StopButton(timer) : _StartButton(timer),
                  ),
                ],
              ),
              onLongPress: () async {
                final result = await showConfirmDialog(
                  context: context,
                  message: S.of(context).deleteTimerQuestion,
                  isDestructive: true,
                );
                if (result ?? false) {
                  context.read<TimerListCubit>().deleteTimerAction(timer.id);
                }
              },
            ),
          ),
        ),
      );
}

class _ResetButton extends StatelessWidget {
  const _ResetButton(this.timer);

  final CustomTimer timer;

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () {
          context.read<TimerCubit>().resetTimer();
          context.read<ForegroundServiceCubit>().removeTimer(timer);
        },
        icon: const Icon(Icons.replay),
      );
}

class _StartButton extends StatelessWidget {
  const _StartButton(this.timer);
  final CustomTimer timer;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: () {
          context.read<TimerCubit>().startTimer();
          context.read<ForegroundServiceCubit>().addTimer(timer);
        },
        child: const Icon(Icons.play_arrow),
      );
}

class _StopButton extends StatelessWidget {
  const _StopButton(this.timer);
  final CustomTimer timer;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: () {
          context.read<TimerCubit>().pauseTimer();
          context.read<ForegroundServiceCubit>().removeTimer(timer);
        },
        child: BlocSelector<TimerCubit, TimerState, bool>(
          selector: (state) => state.isFinished,
          builder: (context, state) => Icon(state ? Icons.stop : Icons.pause),
        ),
      );
}
