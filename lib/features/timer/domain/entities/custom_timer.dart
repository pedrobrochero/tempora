import 'package:equatable/equatable.dart';

import '../../../../generated/l10n.dart';

/// [CustomTimer] is an entity that represents a timer.
class CustomTimer extends Equatable {
  const CustomTimer({
    required this.id,
    required this.name,
    required this.duration,
  });

  final String id;
  final String name;
  final Duration duration;

  @override
  List<Object?> get props => [id, name, duration.inSeconds];

  bool isEquivalentTo(CustomTimer other) =>
      id == other.id && name == other.name && duration == other.duration;
}

/// An enum that represents the sorting options for the timers.
enum TimerSorting {
  /// Sorts by name.
  name,

  /// Sorts by duration.
  duration,

  /// Sorts by times started.
  timesStarted,

  /// Sorts by is favorite.
  isFavorite;

  /// Returns the human readable name of the sorting option.
  String get humanReadableName {
    switch (this) {
      case TimerSorting.name:
        return S.current.name;
      case TimerSorting.duration:
        return S.current.duration;
      case TimerSorting.timesStarted:
        return S.current.timesStarted;
      case TimerSorting.isFavorite:
        return S.current.isFavorite;
    }
  }
}
