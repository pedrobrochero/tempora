import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

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
                      .bodyLarge
                      ?.copyWith(color: Colors.red)
                  : null,
            ),
          ),
        ],
      );
}
