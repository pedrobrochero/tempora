// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_timer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomTimerModel _$CustomTimerModelFromJson(Map<String, dynamic> json) =>
    CustomTimerModel(
      id: json['id'] as String,
      name: json['name'] as String,
      duration: Duration(microseconds: json['duration'] as int),
    );

Map<String, dynamic> _$CustomTimerModelToJson(CustomTimerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duration': instance.duration.inMicroseconds,
    };
