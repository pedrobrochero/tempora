// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TimerListState {
  List<CustomTimer> get timers => throw _privateConstructorUsedError;
  List<TimerCubit> get timersCubits => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimerListStateCopyWith<TimerListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerListStateCopyWith<$Res> {
  factory $TimerListStateCopyWith(
          TimerListState value, $Res Function(TimerListState) then) =
      _$TimerListStateCopyWithImpl<$Res, TimerListState>;
  @useResult
  $Res call({List<CustomTimer> timers, List<TimerCubit> timersCubits});
}

/// @nodoc
class _$TimerListStateCopyWithImpl<$Res, $Val extends TimerListState>
    implements $TimerListStateCopyWith<$Res> {
  _$TimerListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timers = null,
    Object? timersCubits = null,
  }) {
    return _then(_value.copyWith(
      timers: null == timers
          ? _value.timers
          : timers // ignore: cast_nullable_to_non_nullable
              as List<CustomTimer>,
      timersCubits: null == timersCubits
          ? _value.timersCubits
          : timersCubits // ignore: cast_nullable_to_non_nullable
              as List<TimerCubit>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimerListStateCopyWith<$Res>
    implements $TimerListStateCopyWith<$Res> {
  factory _$$_TimerListStateCopyWith(
          _$_TimerListState value, $Res Function(_$_TimerListState) then) =
      __$$_TimerListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CustomTimer> timers, List<TimerCubit> timersCubits});
}

/// @nodoc
class __$$_TimerListStateCopyWithImpl<$Res>
    extends _$TimerListStateCopyWithImpl<$Res, _$_TimerListState>
    implements _$$_TimerListStateCopyWith<$Res> {
  __$$_TimerListStateCopyWithImpl(
      _$_TimerListState _value, $Res Function(_$_TimerListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timers = null,
    Object? timersCubits = null,
  }) {
    return _then(_$_TimerListState(
      timers: null == timers
          ? _value._timers
          : timers // ignore: cast_nullable_to_non_nullable
              as List<CustomTimer>,
      timersCubits: null == timersCubits
          ? _value._timersCubits
          : timersCubits // ignore: cast_nullable_to_non_nullable
              as List<TimerCubit>,
    ));
  }
}

/// @nodoc

class _$_TimerListState implements _TimerListState {
  const _$_TimerListState(
      {final List<CustomTimer> timers = const [],
      final List<TimerCubit> timersCubits = const []})
      : _timers = timers,
        _timersCubits = timersCubits;

  final List<CustomTimer> _timers;
  @override
  @JsonKey()
  List<CustomTimer> get timers {
    if (_timers is EqualUnmodifiableListView) return _timers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timers);
  }

  final List<TimerCubit> _timersCubits;
  @override
  @JsonKey()
  List<TimerCubit> get timersCubits {
    if (_timersCubits is EqualUnmodifiableListView) return _timersCubits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timersCubits);
  }

  @override
  String toString() {
    return 'TimerListState(timers: $timers, timersCubits: $timersCubits)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimerListState &&
            const DeepCollectionEquality().equals(other._timers, _timers) &&
            const DeepCollectionEquality()
                .equals(other._timersCubits, _timersCubits));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_timers),
      const DeepCollectionEquality().hash(_timersCubits));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimerListStateCopyWith<_$_TimerListState> get copyWith =>
      __$$_TimerListStateCopyWithImpl<_$_TimerListState>(this, _$identity);
}

abstract class _TimerListState implements TimerListState {
  const factory _TimerListState(
      {final List<CustomTimer> timers,
      final List<TimerCubit> timersCubits}) = _$_TimerListState;

  @override
  List<CustomTimer> get timers;
  @override
  List<TimerCubit> get timersCubits;
  @override
  @JsonKey(ignore: true)
  _$$_TimerListStateCopyWith<_$_TimerListState> get copyWith =>
      throw _privateConstructorUsedError;
}
