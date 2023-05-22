import 'package:flutter/material.dart';

import '../utils/theme.dart';

class ErrorText extends StatelessWidget {
  const ErrorText(
    this.label, {
    Key? key,
  }) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) => Text(label,
      style:
          Theme.of(context).textTheme.bodySmall?.copyWith(color: errorColor));
}
