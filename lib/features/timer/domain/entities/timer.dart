import 'package:equatable/equatable.dart';

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
  List<Object?> get props => [id];
}
