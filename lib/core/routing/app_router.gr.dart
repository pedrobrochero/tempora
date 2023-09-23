// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:tempora/features/dev/dev_page.dart' as _i1;
import 'package:tempora/features/timer/presentation/pages/timer_list.dart'
    as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    DevRoute.name: (routeData) {
      final args =
          routeData.argsAs<DevRouteArgs>(orElse: () => const DevRouteArgs());
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DevPage(key: args.key),
      );
    },
    TimerListRoute.name: (routeData) {
      final args = routeData.argsAs<TimerListRouteArgs>(
          orElse: () => const TimerListRouteArgs());
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.TimerListPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.DevPage]
class DevRoute extends _i3.PageRouteInfo<DevRouteArgs> {
  DevRoute({
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          DevRoute.name,
          args: DevRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'DevRoute';

  static const _i3.PageInfo<DevRouteArgs> page =
      _i3.PageInfo<DevRouteArgs>(name);
}

class DevRouteArgs {
  const DevRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'DevRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.TimerListPage]
class TimerListRoute extends _i3.PageRouteInfo<TimerListRouteArgs> {
  TimerListRoute({
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          TimerListRoute.name,
          args: TimerListRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'TimerListRoute';

  static const _i3.PageInfo<TimerListRouteArgs> page =
      _i3.PageInfo<TimerListRouteArgs>(name);
}

class TimerListRouteArgs {
  const TimerListRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'TimerListRouteArgs{key: $key}';
  }
}
