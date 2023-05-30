import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/control_classes/status.dart';
import '../../../../core/presentation/utils/context_extension.dart';
import '../../data/datasources/fake_data_source.dart';
import '../../domain/usecases/create_timer.dart';
import '../cubit/timer_form_cubit.dart';

/// A form for creating a new timer.
class TimerForm extends StatelessWidget {
  const TimerForm({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => TimerFormCubit(),
        child: BlocListener<TimerFormCubit, TimerFormState>(
          listener: (context, state) {
            if (state.status is SuccessStatus) {
              final params = CreateTimerParams(
                name: state.name,
                duration: Duration(
                  minutes: int.parse(state.minutes),
                  seconds: int.parse(state.seconds),
                ),
              );
              Navigator.of(context).pop(params);
              return;
            }
          },
          child: Builder(
              builder: (context) => Material(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 16,
                          16 + MediaQuery.of(context).viewInsets.bottom),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Create a new timer',
                            style: context.textTheme.titleLarge,
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            decoration: const InputDecoration(
                              labelText: 'Timer name',
                              hintText: 'Enter a name for your timer',
                            ),
                            autofocus: true,
                            textInputAction: TextInputAction.next,
                            onChanged: context.read<TimerFormCubit>().setName,
                          ),
                          const SizedBox(height: 16),
                          const DurationRow(),
                          //! Duration error
                          // BlocSelector<TimerFormCubit, TimerFormState, String?>(
                          //   selector: (state) => state.durationError,
                          //   builder: (context, state) {
                          //     if (state != null) {
                          //       return Text(
                          //         state,
                          //         style: context.textTheme.bodySmall?.copyWith(
                          //           color: errorColor,
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       );
                          //     }
                          //     return const SizedBox();
                          //   },
                          // ),
                          const SizedBox(height: 8),
                          BlocSelector<TimerFormCubit, TimerFormState, bool>(
                            selector: (state) => state.isValid,
                            builder: (context, state) => ElevatedButton(
                              onPressed: !state
                                  ? null
                                  : context.read<TimerFormCubit>().submit,
                              child: const Text('Create'),
                            ),
                          ),
                          if (kDebugMode)
                            ElevatedButton(
                              onPressed: () {
                                final timer = fakeTimer;
                                final params = CreateTimerParams(
                                  name: timer.name,
                                  duration: timer.duration,
                                );
                                Navigator.of(context).pop(params);
                              },
                              child: const Text('Create test timer'),
                            ),
                        ],
                      ),
                    ),
                  )),
        ),
      );
}

/// A row of two time inputs for minutes and seconds.
class DurationRow extends StatelessWidget {
  const DurationRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Row(
          children: [
            Flexible(
              child: TimeInput(
                initialValue:
                    context.select((TimerFormCubit bloc) => bloc.state.minutes),
                labelText: 'Minutes',
                hintText: '00',
                onChanged: context.read<TimerFormCubit>().setMinutes,
              ),
            ),
            const SizedBox(width: 8),
            Text(':', style: context.textTheme.displayLarge),
            const SizedBox(width: 8),
            Flexible(
              child: TimeInput(
                initialValue:
                    context.select((TimerFormCubit bloc) => bloc.state.seconds),
                labelText: 'Seconds',
                hintText: '00',
                onChanged: context.read<TimerFormCubit>().setSeconds,
                onSubmit: (_) => context.read<TimerFormCubit>().submit(),
              ),
            ),
          ],
        ),
      );
}

/// A text input for a time value.
class TimeInput extends StatefulWidget {
  const TimeInput({
    required this.initialValue,
    required this.labelText,
    required this.hintText,
    required this.onChanged,
    this.onSubmit,
    super.key,
  });

  final String initialValue;
  final String labelText;
  final String hintText;
  final void Function(String value) onChanged;
  final void Function(String value)? onSubmit;

  @override
  State<TimeInput> createState() => _TimeInputState();
}

class _TimeInputState extends State<TimeInput> {
  bool get shouldSubmit => widget.onSubmit != null;

  late final controller = TextEditingController()
    ..text = widget.initialValue
    ..selection =
        TextSelection(baseOffset: 0, extentOffset: widget.initialValue.length);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        textAlign: TextAlign.center,
        style: context.textTheme.displayLarge,
        decoration: InputDecoration(
          labelText: widget.labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          hintText: widget.hintText,
          counter: const SizedBox(),
        ),
        textInputAction:
            shouldSubmit ? TextInputAction.done : TextInputAction.next,
        keyboardType: TextInputType.number,
        maxLength: 2,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onSubmit,
      );
}

/// Shows the create timer form and returns the parameters if the user submits
/// the form.
///
/// Returns null if the user cancels the form.
Future<CreateTimerParams?> showCreateTimerForm(BuildContext context) async {
  final params = await showModalBottomSheet<CreateTimerParams>(
      context: context,
      builder: (context) => const TimerForm(),
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      isScrollControlled: true);
  return params;
}
