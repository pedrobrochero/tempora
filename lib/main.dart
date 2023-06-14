import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/dependency_injection.dart';
import 'core/presentation/utils/theme.dart';
import 'core/routing/app_router.dart';
import 'features/foreground_service/presentation/cubit/foreground_service_cubit.dart';
import 'generated/l10n.dart';

void main() async {
  await initDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return BlocProvider(
      create: (context) => sl<ForegroundServiceCubit>(),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: appTheme,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
