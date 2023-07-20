// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TimerFormState {
  String get name => throw _privateConstructorUsedError;
  String get seconds => throw _privateConstructorUsedError;
  String get minutes => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String? get nameError => throw _privateConstructorUsedError;
  String? get durationError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimerFormStateCopyWith<TimerFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerFormStateCopyWith<$Res> {
  factory $TimerFormStateCopyWith(
          TimerFormState value, $Res Function(TimerFormState) then) =
      _$TimerFormStateCopyWithImpl<$Res, TimerFormState>;
  @useResult
  $Res call(
      {String name,
      String seconds,
      String minutes,
      Status status,
      String? nameError,
      String? durationError});

  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class _$TimerFormStateCopyWithImpl<$Res, $Val extends TimerFormState>
    implements $TimerFormStateCopyWith<$Res> {
  _$TimerFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? seconds = null,
    Object? minutes = null,
    Object? status = null,
    Object? nameError = freezed,
    Object? durationError = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      seconds: null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as String,
      minutes: null == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      nameError: freezed == nameError
          ? _value.nameError
          : nameError // ignore: cast_nullable_to_non_nullable
              as String?,
      durationError: freezed == durationError
          ? _value.durationError
          : durationError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get status {
    return $StatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $TimerFormStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String seconds,
      String minutes,
      Status status,
      String? nameError,
      String? durationError});

  @override
  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$TimerFormStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? seconds = null,
    Object? minutes = null,
    Object? status = null,
    Object? nameError = freezed,
    Object? durationError = freezed,
  }) {
    return _then(_$_Initial(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      seconds: null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as String,
      minutes: null == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      nameError: freezed == nameError
          ? _value.nameError
          : nameError // ignore: cast_nullable_to_non_nullable
              as String?,
      durationError: freezed == durationError
          ? _value.durationError
          : durationError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial(
      {required this.name,
      required this.seconds,
      required this.minutes,
      this.status = const InitialStatus(),
      this.nameError,
      this.durationError})
      : super._();

  @override
  final String name;
  @override
  final String seconds;
  @override
  final String minutes;
  @override
  @JsonKey()
  final Status status;
  @override
  final String? nameError;
  @override
  final String? durationError;

  @override
  String toString() {
    return 'TimerFormState(name: $name, seconds: $seconds, minutes: $minutes, status: $status, nameError: $nameError, durationError: $durationError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.seconds, seconds) || other.seconds == seconds) &&
            (identical(other.minutes, minutes) || other.minutes == minutes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.nameError, nameError) ||
                other.nameError == nameError) &&
            (identical(other.durationError, durationError) ||
                other.durationError == durationError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, seconds, minutes, status, nameError, durationError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial extends TimerFormState {
  const factory _Initial(
      {required final String name,
      required final String seconds,
      required final String minutes,
      final Status status,
      final String? nameError,
      final String? durationError}) = _$_Initial;
  const _Initial._() : super._();

  @override
  String get name;
  @override
  String get seconds;
  @override
  String get minutes;
  @override
  Status get status;
  @override
  String? get nameError;
  @override
  String? get durationError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
