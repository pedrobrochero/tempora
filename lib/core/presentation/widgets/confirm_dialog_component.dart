import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

/// Shows a dialog to confirm an action.
///
/// Returns `true` if the user confirms, `false` if the user cancels.
Future<bool?> showConfirmDialog({
  required BuildContext context,
  required String message,
  String? confirmLabel,
  String? cancelLabel,
  bool isDestructive = false,
}) =>
    showDialog<bool>(
      context: context,
      builder: (context) => ConfirmDialogComponent(
        message: message,
        confirmLabel: confirmLabel,
        cancelLabel: cancelLabel,
        isDestructive: isDestructive,
      ),
    );

class ConfirmDialogComponent extends StatelessWidget {
  const ConfirmDialogComponent({
    required this.message,
    this.isDestructive = false,
    this.confirmLabel,
    this.cancelLabel,
    Key? key,
  }) : super(key: key);
  final String message;
  final String? confirmLabel;
  final String? cancelLabel;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Center(child: Text(S.of(context).attention)),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(cancelLabel ?? S.of(context).cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              confirmLabel ?? S.of(context).confirm,
              style: isDestructive
                  ? Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.red)
                  : null,
            ),
          ),
        ],
      );
}
