import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class EmptyListComponent extends StatelessWidget {
  const EmptyListComponent({
    Key? key,
    this.message,
    this.reverse = false,
  }) : super(key: key);
  final String? message;
  final bool reverse;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            reverse: reverse,
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth,
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.error_outline,
                        size: 56,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        message ?? S.of(context).nothingToShow,
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ))),
      );
}
