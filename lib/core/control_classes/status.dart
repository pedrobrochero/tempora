import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';

@freezed
class Status with _$Status {
  const factory Status.initial() = InitialStatus;
  const factory Status.loading() = LoadingStatus;
  const factory Status.error([String? message]) = ErrorStatus;
  const factory Status.loaded() = LoadedStatus;
  const factory Status.success() = SuccessStatus;
}
