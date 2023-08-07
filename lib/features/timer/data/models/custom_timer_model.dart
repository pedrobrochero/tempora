// ignore_for_file: overridden_fields

import 'package:json_annotation/json_annotation.dart';

import '../../../../core/data/utils/sqlite_parsers.dart';
import '../../domain/entities/custom_timer.dart';

part 'custom_timer_model.g.dart';

@JsonSerializable()
class CustomTimerModel extends CustomTimer {
  const CustomTimerModel({
    required super.id,
    required super.name,
    required super.duration,
    super.timesStarted = 0,
    this.isFavorite = false,
  }) : super(isFavorite: isFavorite);

  factory CustomTimerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomTimerModelFromJson(json);

  @override
  @JsonKey(toJson: boolToInt, fromJson: boolFromInt)
  final bool isFavorite;

  Map<String, dynamic> toJson() => _$CustomTimerModelToJson(this);
}
