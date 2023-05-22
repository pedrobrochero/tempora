// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

mixin Logging {
  Logger? _logger;

  Logger get log => _logger ??= Logger(
        printer: SimpleLogPrinter(scope: '$runtimeType', colorsEnabled: true),
      );
}

class SimpleLogPrinter extends LogPrinter {
  SimpleLogPrinter({
    required this.scope,
    this.colorsEnabled = false,
  });

  final String scope;
  final bool colorsEnabled;

  @override
  List<String> log(LogEvent event) {
    if (kReleaseMode) {
      return [];
    }
    final logColor = PrettyPrinter.levelColors[event.level];
    final emoji = PrettyPrinter.levelEmojis[event.level];
    final message = event.message;
    const splitter = LineSplitter();
    final splitMessage = splitter.convert('$message');
    splitMessage[0] = '$emoji $scope - ${splitMessage[0]}';
    if (colorsEnabled) {
      return splitMessage.map((line) => logColor!(line)).toList();
    }
    return splitMessage;
  }
}
