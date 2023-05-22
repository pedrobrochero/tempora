// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Status {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
    required TResult Function() loaded,
    required TResult Function() success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
    TResult? Function()? loaded,
    TResult? Function()? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    TResult Function()? loaded,
    TResult Function()? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialStatus value) initial,
    required TResult Function(LoadingStatus value) loading,
    required TResult Function(ErrorStatus value) error,
    required TResult Function(LoadedStatus value) loaded,
    required TResult Function(SuccessStatus value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialStatus value)? initial,
    TResult? Function(LoadingStatus value)? loading,
    TResult? Function(ErrorStatus value)? error,
    TResult? Function(LoadedStatus value)? loaded,
    TResult? Function(SuccessStatus value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialStatus value)? initial,
    TResult Function(LoadingStatus value)? loading,
    TResult Function(ErrorStatus value)? error,
    TResult Function(LoadedStatus value)? loaded,
    TResult Function(SuccessStatus value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusCopyWith<$Res> {
  factory $StatusCopyWith(Status value, $Res Function(Status) then) =
      _$StatusCopyWithImpl<$Res, Status>;
}

/// @nodoc
class _$StatusCopyWithImpl<$Res, $Val extends Status>
    implements $StatusCopyWith<$Res> {
  _$StatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialStatusCopyWith<$Res> {
  factory _$$InitialStatusCopyWith(
          _$InitialStatus value, $Res Function(_$InitialStatus) then) =
      __$$InitialStatusCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialStatusCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$InitialStatus>
    implements _$$InitialStatusCopyWith<$Res> {
  __$$InitialStatusCopyWithImpl(
      _$InitialStatus _value, $Res Function(_$InitialStatus) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialStatus implements InitialStatus {
  const _$InitialStatus();

  @override
  String toString() {
    return 'Status.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialStatus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
    required TResult Function() loaded,
    required TResult Function() success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
    TResult? Function()? loaded,
    TResult? Function()? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    TResult Function()? loaded,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialStatus value) initial,
    required TResult Function(LoadingStatus value) loading,
    required TResult Function(ErrorStatus value) error,
    required TResult Function(LoadedStatus value) loaded,
    required TResult Function(SuccessStatus value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialStatus value)? initial,
    TResult? Function(LoadingStatus value)? loading,
    TResult? Function(ErrorStatus value)? error,
    TResult? Function(LoadedStatus value)? loaded,
    TResult? Function(SuccessStatus value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialStatus value)? initial,
    TResult Function(LoadingStatus value)? loading,
    TResult Function(ErrorStatus value)? error,
    TResult Function(LoadedStatus value)? loaded,
    TResult Function(SuccessStatus value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialStatus implements Status {
  const factory InitialStatus() = _$InitialStatus;
}

/// @nodoc
abstract class _$$LoadingStatusCopyWith<$Res> {
  factory _$$LoadingStatusCopyWith(
          _$LoadingStatus value, $Res Function(_$LoadingStatus) then) =
      __$$LoadingStatusCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStatusCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$LoadingStatus>
    implements _$$LoadingStatusCopyWith<$Res> {
  __$$LoadingStatusCopyWithImpl(
      _$LoadingStatus _value, $Res Function(_$LoadingStatus) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingStatus implements LoadingStatus {
  const _$LoadingStatus();

  @override
  String toString() {
    return 'Status.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStatus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
    required TResult Function() loaded,
    required TResult Function() success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
    TResult? Function()? loaded,
    TResult? Function()? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    TResult Function()? loaded,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialStatus value) initial,
    required TResult Function(LoadingStatus value) loading,
    required TResult Function(ErrorStatus value) error,
    required TResult Function(LoadedStatus value) loaded,
    required TResult Function(SuccessStatus value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialStatus value)? initial,
    TResult? Function(LoadingStatus value)? loading,
    TResult? Function(ErrorStatus value)? error,
    TResult? Function(LoadedStatus value)? loaded,
    TResult? Function(SuccessStatus value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialStatus value)? initial,
    TResult Function(LoadingStatus value)? loading,
    TResult Function(ErrorStatus value)? error,
    TResult Function(LoadedStatus value)? loaded,
    TResult Function(SuccessStatus value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingStatus implements Status {
  const factory LoadingStatus() = _$LoadingStatus;
}

/// @nodoc
abstract class _$$ErrorStatusCopyWith<$Res> {
  factory _$$ErrorStatusCopyWith(
          _$ErrorStatus value, $Res Function(_$ErrorStatus) then) =
      __$$ErrorStatusCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$ErrorStatusCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$ErrorStatus>
    implements _$$ErrorStatusCopyWith<$Res> {
  __$$ErrorStatusCopyWithImpl(
      _$ErrorStatus _value, $Res Function(_$ErrorStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ErrorStatus(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ErrorStatus implements ErrorStatus {
  const _$ErrorStatus([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'Status.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorStatus &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorStatusCopyWith<_$ErrorStatus> get copyWith =>
      __$$ErrorStatusCopyWithImpl<_$ErrorStatus>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
    required TResult Function() loaded,
    required TResult Function() success,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
    TResult? Function()? loaded,
    TResult? Function()? success,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    TResult Function()? loaded,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialStatus value) initial,
    required TResult Function(LoadingStatus value) loading,
    required TResult Function(ErrorStatus value) error,
    required TResult Function(LoadedStatus value) loaded,
    required TResult Function(SuccessStatus value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialStatus value)? initial,
    TResult? Function(LoadingStatus value)? loading,
    TResult? Function(ErrorStatus value)? error,
    TResult? Function(LoadedStatus value)? loaded,
    TResult? Function(SuccessStatus value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialStatus value)? initial,
    TResult Function(LoadingStatus value)? loading,
    TResult Function(ErrorStatus value)? error,
    TResult Function(LoadedStatus value)? loaded,
    TResult Function(SuccessStatus value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorStatus implements Status {
  const factory ErrorStatus([final String? message]) = _$ErrorStatus;

  String? get message;
  @JsonKey(ignore: true)
  _$$ErrorStatusCopyWith<_$ErrorStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedStatusCopyWith<$Res> {
  factory _$$LoadedStatusCopyWith(
          _$LoadedStatus value, $Res Function(_$LoadedStatus) then) =
      __$$LoadedStatusCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadedStatusCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$LoadedStatus>
    implements _$$LoadedStatusCopyWith<$Res> {
  __$$LoadedStatusCopyWithImpl(
      _$LoadedStatus _value, $Res Function(_$LoadedStatus) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadedStatus implements LoadedStatus {
  const _$LoadedStatus();

  @override
  String toString() {
    return 'Status.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadedStatus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
    required TResult Function() loaded,
    required TResult Function() success,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
    TResult? Function()? loaded,
    TResult? Function()? success,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    TResult Function()? loaded,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialStatus value) initial,
    required TResult Function(LoadingStatus value) loading,
    required TResult Function(ErrorStatus value) error,
    required TResult Function(LoadedStatus value) loaded,
    required TResult Function(SuccessStatus value) success,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialStatus value)? initial,
    TResult? Function(LoadingStatus value)? loading,
    TResult? Function(ErrorStatus value)? error,
    TResult? Function(LoadedStatus value)? loaded,
    TResult? Function(SuccessStatus value)? success,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialStatus value)? initial,
    TResult Function(LoadingStatus value)? loading,
    TResult Function(ErrorStatus value)? error,
    TResult Function(LoadedStatus value)? loaded,
    TResult Function(SuccessStatus value)? success,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedStatus implements Status {
  const factory LoadedStatus() = _$LoadedStatus;
}

/// @nodoc
abstract class _$$SuccessStatusCopyWith<$Res> {
  factory _$$SuccessStatusCopyWith(
          _$SuccessStatus value, $Res Function(_$SuccessStatus) then) =
      __$$SuccessStatusCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessStatusCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$SuccessStatus>
    implements _$$SuccessStatusCopyWith<$Res> {
  __$$SuccessStatusCopyWithImpl(
      _$SuccessStatus _value, $Res Function(_$SuccessStatus) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessStatus implements SuccessStatus {
  const _$SuccessStatus();

  @override
  String toString() {
    return 'Status.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessStatus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
    required TResult Function() loaded,
    required TResult Function() success,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
    TResult? Function()? loaded,
    TResult? Function()? success,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    TResult Function()? loaded,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialStatus value) initial,
    required TResult Function(LoadingStatus value) loading,
    required TResult Function(ErrorStatus value) error,
    required TResult Function(LoadedStatus value) loaded,
    required TResult Function(SuccessStatus value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialStatus value)? initial,
    TResult? Function(LoadingStatus value)? loading,
    TResult? Function(ErrorStatus value)? error,
    TResult? Function(LoadedStatus value)? loaded,
    TResult? Function(SuccessStatus value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialStatus value)? initial,
    TResult Function(LoadingStatus value)? loading,
    TResult Function(ErrorStatus value)? error,
    TResult Function(LoadedStatus value)? loaded,
    TResult Function(SuccessStatus value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessStatus implements Status {
  const factory SuccessStatus() = _$SuccessStatus;
}
