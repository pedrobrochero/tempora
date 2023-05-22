import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class ErrorComponent extends StatelessWidget {
  const ErrorComponent({
    this.message,
    Key? key,
    this.retryCallback,
  }) : super(key: key);
  final String? message;
  final VoidCallback? retryCallback;

  @override
  Widget build(BuildContext context) => Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.cancel, size: 48, color: Colors.red),
          const SizedBox(height: 8),
          Text(
            message ?? S.of(context).anErrorHasOcurred,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          if (retryCallback != null) ...[
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: retryCallback,
              icon: const Icon(Icons.refresh),
              label: Text(S.of(context).retry),
            ),
          ]
        ],
      ));
}
