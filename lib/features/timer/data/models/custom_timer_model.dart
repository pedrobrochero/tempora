import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/timer.dart';

part 'custom_timer_model.g.dart';

@JsonSerializable()
class CustomTimerModel extends CustomTimer {
  CustomTimerModel({
    required super.id,
    required super.name,
    required super.duration,
  });

  factory CustomTimerModel.fromEntity(CustomTimer entity) => CustomTimerModel(
        id: entity.id,
        name: entity.name,
        duration: entity.duration,
      );

  factory CustomTimerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomTimerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomTimerModelToJson(this);
}
