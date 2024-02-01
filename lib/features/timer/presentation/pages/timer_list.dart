import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_to_background/move_to_background.dart';
import 'package:screen_state/screen_state.dart';

import '../../../../core/control_classes/status.dart';
import '../../../../core/dependency_injection.dart';
import '../../../../core/presentation/utils/context_extension.dart';
import '../../../../core/presentation/widgets/custom_drawer.dart';
import '../../../../core/presentation/widgets/empty_list_component.dart';
import '../../../../core/presentation/widgets/my_banner.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entities/custom_timer.dart';
import '../../domain/usecases/create_timer.dart';
import '../cubit/timer_list_cubit.dart';
import '../widgets/timer_form.dart';
import '../widgets/timer_tile.dart';

@RoutePage()
class TimerListPage extends StatefulWidget {
  const TimerListPage({Key? key}) : super(key: key);

  @override
  State<TimerListPage> createState() => _TimerListPageState();
}

class _TimerListPageState extends State<TimerListPage>
    with WidgetsBindingObserver {
  // It's normal for this bloc to never be closed, as this is a one page
  // app. This is done because the timersCubits are created, closed and
  // stored in this cubit, to avoid mess.
  final timerListCubit = sl<TimerListCubit>();

  /// The subscription to the screen state stream.
  StreamSubscription<ScreenStateEvent>? screenSubscription;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addObserver(this);
    screenSubscription = Screen().screenStateStream?.listen(
      (event) {
        if (event == ScreenStateEvent.SCREEN_OFF) {
          MoveToBackground.moveTaskToBack();
        }
      },
    );
  }

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    screenSubscription?.cancel();
    super.dispose();
  }

  // TODO(pedrobrochero): On resume app lifecycle, check if some timer is
  // finished and scroll to it.

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: timerListCubit,
        child: Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).myTimers),
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.sort),
                  onPressed: () async {
                    final result = await showDialog(
                      context: context,
                      builder: (_) => SimpleDialog(
                        title: Text(S.of(context).sortBy),
                        children: TimerSorting.values.map((e) {
                          final state = context.read<TimerListCubit>().state;
                          final isSelected = state.sorting == e;
                          return SimpleDialogOption(
                            onPressed: () => Navigator.pop(context, e),
                            padding: EdgeInsets.zero,
                            child: Container(
                              color: isSelected
                                  ? context.colorScheme.primary.withOpacity(0.1)
                                  : null,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 24),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(e.humanReadableName),
                                  if (isSelected)
                                    Icon(state.reverseSorting
                                        ? Icons.arrow_upward_sharp
                                        : Icons.arrow_downward_sharp),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                    if (result is TimerSorting) {
                      context.read<TimerListCubit>().sort(result);
                    }
                  },
                ),
              ),
            ],
          ),
          drawer: const CustomDrawer(),
          body: Column(
            children: [
              const MyBanner(mainPageBannerAdUnitId),
              Expanded(
                child: BlocConsumer<TimerListCubit, TimerListState>(
                  listener: (context, state) {
                    if (state.status is ErrorStatus) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(S.of(context).anErrorHasOcurred)),
                      );
                    }
                  },
                  builder: (context, state) {
                    final timers = state.timers;
                    if (timers.isEmpty) {
                      return EmptyListComponent(
                          message: S.of(context).noTimersYet);
                    }
                    return ListView.builder(
                      itemCount: timers.length + 1,
                      itemBuilder: (context, index) {
                        // Spacer to avoid overlapping with FAB.
                        if (index == timers.length) {
                          return const SizedBox(height: 80);
                        }
                        return Builder(builder: (context) {
                          final timerCubit =
                              timerListCubit.getTimerCubit(timers[index]);
                          return TimerTile(
                            cubit: timerCubit,
                            key: ValueKey(timers[index]),
                          );
                        });
                      },
                    );
                  },
                ),
              ),
            ],
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
