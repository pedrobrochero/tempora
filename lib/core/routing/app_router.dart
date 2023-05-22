import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        if (kDebugMode) AutoRoute(page: DevRoute.page),
        AutoRoute(page: TimerListRoute.page, initial: true),
      ];
}
