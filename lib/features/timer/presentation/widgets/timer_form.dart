import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/control_classes/status.dart';
import '../../../../core/presentation/utils/context_extension.dart';
import '../../../../generated/l10n.dart';
import '../../data/datasources/fake_data_source.dart';
import '../../domain/entities/custom_timer.dart';
import '../../domain/usecases/create_timer.dart';
import '../cubit/timer_form_cubit.dart';

/// A form for creating a new timer.
class TimerForm extends StatelessWidget {
  const TimerForm({
    this.timer,
    super.key,
  });

  /// The timer to edit, if any.
  final CustomTimer? timer;

  /// Whether the form is being used to edit an existing timer.
  bool get isEditing => timer != null;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => TimerFormCubit(timer),
        child: BlocListener<TimerFormCubit, TimerFormState>(
          listener: (context, state) {
            if (state.status is SuccessStatus) {
              final params = isEditing
                  ? CustomTimer(
                      id: timer!.id,
                      name: state.name,
                      duration: state.duration,
                    )
                  : CreateTimerParams(
                      name: state.name,
                      duration: state.duration,
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
                            isEditing
                                ? S.of(context).editTimer
                                : S.of(context).createTimer,
                            style: context.textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            initialValue: timer?.name,
                            decoration: InputDecoration(
                              labelText: S.of(context).timerName,
                              hintText: S.of(context).enterANameForYourTimer,
                            ),
                            autofocus: true,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.sentences,
                            onChanged: context.read<TimerFormCubit>().setName,
                          ),
                          const SizedBox(height: 16),
                          DurationRow(initialDuration: timer?.duration),
                          //! Duration error
                          BlocSelector<TimerFormCubit, TimerFormState, String?>(
                            selector: (state) => state.durationError,
                            builder: (context, state) => Text(
                              state ?? '',
                              style: context.textTheme.bodySmall?.copyWith(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          BlocSelector<TimerFormCubit, TimerFormState, bool>(
                            selector: (state) => state.isValid,
                            builder: (context, state) => ElevatedButton(
                              onPressed: !state
                                  ? null
                                  : context.read<TimerFormCubit>().submit,
                              child: Text(isEditing
                                  ? S.of(context).saveChanges
                                  : S.of(context).create),
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
    this.initialDuration,
    super.key,
  });

  final Duration? initialDuration;

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 112,
            child: TimeInput(
              initialValue: initialDuration?.inMinutes,
              labelText: S.of(context).minutes,
              hintText: '00',
              onChanged: context.read<TimerFormCubit>().setMinutes,
            ),
          ),
          const SizedBox(width: 8),
          Text(':', style: context.textTheme.displayLarge),
          const SizedBox(width: 8),
          SizedBox(
            width: 112,
            child: TimeInput(
              initialValue: initialDuration?.inSeconds.remainder(60),
              labelText: S.of(context).seconds,
              hintText: '00',
              onChanged: context.read<TimerFormCubit>().setSeconds,
              onSubmit: (_) => context.read<TimerFormCubit>().submit(),
            ),
          ),
        ],
      );
}

/// A text input for a time value.
class TimeInput extends StatefulWidget {
  const TimeInput({
    required this.labelText,
    required this.hintText,
    required this.onChanged,
    this.initialValue,
    this.onSubmit,
    super.key,
  });

  final int? initialValue;
  final String labelText;
  final String hintText;
  final void Function(String value) onChanged;
  final void Function(String value)? onSubmit;

  @override
  State<TimeInput> createState() => _TimeInputState();
}

class _TimeInputState extends State<TimeInput> {
  bool get shouldSubmit => widget.onSubmit != null;

  String get initialValue =>
      widget.initialValue?.toString().padLeft(2, '0') ?? '';

  late final controller = TextEditingController()
    ..text = initialValue
    ..selection =
        TextSelection(baseOffset: 0, extentOffset: initialValue.length);

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

/// Shows the edit timer form and returns the parameters if the user submits the
/// form.
///
/// Returns null if the user cancels the form.
Future<CustomTimer?>? showEditTimerForm(
    BuildContext context, CustomTimer timer) async {
  final params = await showModalBottomSheet<CustomTimer>(
      context: context,
      builder: (context) => TimerForm(timer: timer),
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      isScrollControlled: true);
  return params;
}
