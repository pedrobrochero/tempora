import 'dart:convert';

import '../../control_classes/failure.dart';

//! DateTime

DateTime dateTimeFromMilliseconds(int millisecondsSinceEpoch) =>
    DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch, isUtc: true)
        .toLocal();

DateTime? dateTimeFromMillisecondsNullable(int? millisecondsSinceEpoch) {
  if (millisecondsSinceEpoch == null) {
    return null;
  }
  return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch,
          isUtc: true)
      .toLocal();
}

//! Bools

bool boolFromInt(int value) {
  if (value == 1) {
    return true;
  }
  if (value == 0) {
    return false;
  }
  throw ParsingFailure('Parsing bool from value different from 0 and 1.');
}

bool? boolFromIntNullable(int? value) {
  if (value == null) {
    return null;
  }
  if (value == 1) {
    return true;
  }
  if (value == 0) {
    return false;
  }
  throw ParsingFailure('Parsing bool from value different from 0, 1 and null.');
}

// ignore: avoid_positional_boolean_parameters
int boolToInt(bool value) => value ? 1 : 0;

//! Lists

List<T> listFromString<T>(
  String value, {
  T Function(Object?)? decodeFunction,
}) {
  if (decodeFunction != null) {
    final list = jsonDecode(value) as List;
    final parsedList = list.map(decodeFunction).toList();
    return parsedList;
  }
  return jsonDecode(value);
}

String listToString(
  List value, {
  String Function(Object?)? encodeFunction,
}) {
  if (encodeFunction != null) {
    final encodedIterable = value.map(encodeFunction).toList();
    return jsonEncode(encodedIterable);
  }
  return jsonEncode(value);
}
