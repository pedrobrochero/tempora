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
  Status get status => throw _privateConstructorUsedError;
  List<CustomTimer> get timers => throw _privateConstructorUsedError;
  TimerSorting get sorting => throw _privateConstructorUsedError;
  bool get reverseSorting => throw _privateConstructorUsedError;

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
  $Res call(
      {Status status,
      List<CustomTimer> timers,
      TimerSorting sorting,
      bool reverseSorting});

  $StatusCopyWith<$Res> get status;
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
    Object? status = null,
    Object? timers = null,
    Object? sorting = null,
    Object? reverseSorting = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      timers: null == timers
          ? _value.timers
          : timers // ignore: cast_nullable_to_non_nullable
              as List<CustomTimer>,
      sorting: null == sorting
          ? _value.sorting
          : sorting // ignore: cast_nullable_to_non_nullable
              as TimerSorting,
      reverseSorting: null == reverseSorting
          ? _value.reverseSorting
          : reverseSorting // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$_TimerListStateCopyWith<$Res>
    implements $TimerListStateCopyWith<$Res> {
  factory _$$_TimerListStateCopyWith(
          _$_TimerListState value, $Res Function(_$_TimerListState) then) =
      __$$_TimerListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      List<CustomTimer> timers,
      TimerSorting sorting,
      bool reverseSorting});

  @override
  $StatusCopyWith<$Res> get status;
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
    Object? status = null,
    Object? timers = null,
    Object? sorting = null,
    Object? reverseSorting = null,
  }) {
    return _then(_$_TimerListState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      timers: null == timers
          ? _value._timers
          : timers // ignore: cast_nullable_to_non_nullable
              as List<CustomTimer>,
      sorting: null == sorting
          ? _value.sorting
          : sorting // ignore: cast_nullable_to_non_nullable
              as TimerSorting,
      reverseSorting: null == reverseSorting
          ? _value.reverseSorting
          : reverseSorting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TimerListState implements _TimerListState {
  const _$_TimerListState(
      {this.status = const Status.loading(),
      final List<CustomTimer> timers = const [],
      this.sorting = TimerSorting.isFavorite,
      this.reverseSorting = false})
      : _timers = timers;

  @override
  @JsonKey()
  final Status status;
  final List<CustomTimer> _timers;
  @override
  @JsonKey()
  List<CustomTimer> get timers {
    if (_timers is EqualUnmodifiableListView) return _timers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timers);
  }

  @override
  @JsonKey()
  final TimerSorting sorting;
  @override
  @JsonKey()
  final bool reverseSorting;

  @override
  String toString() {
    return 'TimerListState(status: $status, timers: $timers, sorting: $sorting, reverseSorting: $reverseSorting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimerListState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._timers, _timers) &&
            (identical(other.sorting, sorting) || other.sorting == sorting) &&
            (identical(other.reverseSorting, reverseSorting) ||
                other.reverseSorting == reverseSorting));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_timers), sorting, reverseSorting);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimerListStateCopyWith<_$_TimerListState> get copyWith =>
      __$$_TimerListStateCopyWithImpl<_$_TimerListState>(this, _$identity);
}

abstract class _TimerListState implements TimerListState {
  const factory _TimerListState(
      {final Status status,
      final List<CustomTimer> timers,
      final TimerSorting sorting,
      final bool reverseSorting}) = _$_TimerListState;

  @override
  Status get status;
  @override
  List<CustomTimer> get timers;
  @override
  TimerSorting get sorting;
  @override
  bool get reverseSorting;
  @override
  @JsonKey(ignore: true)
  _$$_TimerListStateCopyWith<_$_TimerListState> get copyWith =>
      throw _privateConstructorUsedError;
}
