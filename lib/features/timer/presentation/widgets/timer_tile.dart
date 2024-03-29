import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/presentation/utils/context_extension.dart';
import '../../../../core/presentation/widgets/confirm_dialog_component.dart';
import '../../../../generated/l10n.dart';
import '../../../foreground_service/presentation/cubit/foreground_service_cubit.dart';
import '../../domain/entities/custom_timer.dart';
import '../cubit/timer_cubit.dart';
import '../cubit/timer_list_cubit.dart';
import 'timer_form.dart';

/// A [Widget] that displays a timer.
class TimerTile extends StatelessWidget {
  const TimerTile({
    required this.cubit,
    super.key,
  });

  final TimerCubit cubit;

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: cubit,
        child: BlocBuilder<TimerCubit, TimerState>(
          builder: (context, state) => Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: state.isFinished ? Colors.red : null,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: state.isRunning
                      ? Theme.of(context).colorScheme.primary
                      : state.isPaused
                          ? Colors.amber
                          : Colors.transparent,
                  width: 2),
            ),
            child: Slidable(
              startActionPane: cubit.state.status != TimerStatus.initial
                  ? null
                  : ActionPane(
                      extentRatio: 0.9,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          flex: 6,
                          onPressed: (_) => deleteTimer(context),
                          backgroundColor: Colors.red.shade900,
                          icon: Icons.delete,
                          label: S.of(context).delete,
                        ),
                        SlidableAction(
                          flex: 6,
                          onPressed: (_) => editTimer(context),
                          backgroundColor: Colors.orange.shade900,
                          icon: Icons.edit,
                          label: S.of(context).edit,
                        ),
                        SlidableAction(
                          flex: 7,
                          onPressed: (_) => context
                              .read<TimerListCubit>()
                              .toggleFavorite(cubit.timer),
                          backgroundColor: Colors.black,
                          icon: cubit.timer.isFavorite
                              ? Icons.star_border
                              : Icons.star,
                          label: cubit.timer.isFavorite
                              ? S.of(context).unfavorite
                              : S.of(context).favorite,
                        ),
                      ],
                    ),
              child: ListTile(
                title: Row(
                  children: [
                    if (cubit.timer.isFavorite) ...[
                      Icon(Icons.star,
                          size: 16, color: context.colorScheme.primary),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      cubit.timer.name,
                      style: context.textTheme.labelSmall,
                    ),
                  ],
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
                    _ResetButton(cubit.timer),
                    BlocSelector<TimerCubit, TimerState, bool>(
                      selector: (state) => state.isRunning,
                      builder: (context, state) => state
                          ? _StopButton(cubit.timer)
                          : _StartButton(cubit.timer),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  void editTimer(BuildContext context) async {
    final result = await showEditTimerForm(context, cubit.timer);
    if (result != null) {
      context.read<TimerListCubit>().editTimer(result);
    }
  }

  void deleteTimer(BuildContext context) async {
    final result = await showConfirmDialog(
      context: context,
      message: S.of(context).deleteTimerQuestion,
      isDestructive: true,
    );
    if (result ?? false) {
      context.read<TimerListCubit>().deleteTimer(cubit.timer);
    }
  }
}

class _ResetButton extends StatelessWidget {
  const _ResetButton(this.timer);

  final CustomTimer timer;

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () {
          context.read<TimerCubit>().resetTimer();
          context.read<ForegroundServiceCubit>().removeTimer(timer.id);
        },
        icon: const Icon(Icons.replay),
      );
}

class _StartButton extends StatelessWidget {
  const _StartButton(this.timer);
  final CustomTimer timer;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: () async {
          await context.read<TimerCubit>().resetTimer();
          context.read<TimerCubit>().startTimer();
          context.read<ForegroundServiceCubit>().addTimer(timer.id);
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
          context.read<ForegroundServiceCubit>().removeTimer(timer.id);
        },
        child: BlocSelector<TimerCubit, TimerState, bool>(
          selector: (state) => state.isFinished,
          builder: (context, state) => Icon(state ? Icons.stop : Icons.pause),
        ),
      );
}
