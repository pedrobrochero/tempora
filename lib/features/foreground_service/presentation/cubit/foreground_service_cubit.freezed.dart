// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'foreground_service_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForegroundServiceState {
  List<String> get activeTimerIds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForegroundServiceStateCopyWith<ForegroundServiceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForegroundServiceStateCopyWith<$Res> {
  factory $ForegroundServiceStateCopyWith(ForegroundServiceState value,
          $Res Function(ForegroundServiceState) then) =
      _$ForegroundServiceStateCopyWithImpl<$Res, ForegroundServiceState>;
  @useResult
  $Res call({List<String> activeTimerIds});
}

/// @nodoc
class _$ForegroundServiceStateCopyWithImpl<$Res,
        $Val extends ForegroundServiceState>
    implements $ForegroundServiceStateCopyWith<$Res> {
  _$ForegroundServiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeTimerIds = null,
  }) {
    return _then(_value.copyWith(
      activeTimerIds: null == activeTimerIds
          ? _value.activeTimerIds
          : activeTimerIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $ForegroundServiceStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> activeTimerIds});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$ForegroundServiceStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeTimerIds = null,
  }) {
    return _then(_$_Initial(
      activeTimerIds: null == activeTimerIds
          ? _value._activeTimerIds
          : activeTimerIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({final List<String> activeTimerIds = const []})
      : _activeTimerIds = activeTimerIds;

  final List<String> _activeTimerIds;
  @override
  @JsonKey()
  List<String> get activeTimerIds {
    if (_activeTimerIds is EqualUnmodifiableListView) return _activeTimerIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeTimerIds);
  }

  @override
  String toString() {
    return 'ForegroundServiceState(activeTimerIds: $activeTimerIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality()
                .equals(other._activeTimerIds, _activeTimerIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_activeTimerIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements ForegroundServiceState {
  const factory _Initial({final List<String> activeTimerIds}) = _$_Initial;

  @override
  List<String> get activeTimerIds;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
