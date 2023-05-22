import 'package:flutter/material.dart';

class KeyboardDismiss extends StatelessWidget {
  const KeyboardDismiss({
    required this.child,
    this.onDismiss,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onDismiss;


  @override
  Widget build(BuildContext context) => GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
          onDismiss?.call();
        }
      },
      child: child,
    );
}
