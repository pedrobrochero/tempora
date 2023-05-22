import 'package:flutter/material.dart';

void showSnackbar(
  BuildContext context, {
  required String message,
}) {
  ScaffoldMessenger.maybeOf(context)?.clearSnackBars();
  ScaffoldMessenger.maybeOf(
    context,
  )?.showSnackBar(SnackBar(
    content: Text(message),
  ));
}

void showErrorSnackbar(
  BuildContext context, {
  String? message,
}) {
  ScaffoldMessenger.maybeOf(context)?.clearSnackBars();
  ScaffoldMessenger.maybeOf(
    context,
  )?.showSnackBar(SnackBar(
    content: Text(message ?? 'Ha ocurrido un error.'),
    backgroundColor: Colors.red,
  ));
}
