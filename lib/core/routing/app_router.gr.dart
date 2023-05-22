// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:tempora/features/dev/dev_page.dart' as _i1;
import 'package:tempora/features/timer/presentation/pages/timer_list.dart'
    as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    DevRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DevPage(),
      );
    },
    TimerListRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.TimerListPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.DevPage]
class DevRoute extends _i3.PageRouteInfo<void> {
  const DevRoute({List<_i3.PageRouteInfo>? children})
      : super(
          DevRoute.name,
          initialChildren: children,
        );

  static const String name = 'DevRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.TimerListPage]
class TimerListRoute extends _i3.PageRouteInfo<void> {
  const TimerListRoute({List<_i3.PageRouteInfo>? children})
      : super(
          TimerListRoute.name,
          initialChildren: children,
        );

  static const String name = 'TimerListRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
