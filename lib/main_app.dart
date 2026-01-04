import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/app_theme/app_theme.dart';
import 'package:flutter_template/core/routes/app_routes.dart';
import 'package:flutter_template/core/routes/app_routes.gr.dart';
import 'package:flutter_template/features/auth/presentation/cubit/authentication_cubit.dart';
import 'package:flutter_template/l10n/app_localizations.dart';

import 'core/app_theme/app_theme_cubit.dart';
import 'core/app_theme/app_theme_type.dart';
import 'core/injection/injection.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final AppRouter _router;

  @override
  void initState() {
    _router = getIt<AppRouter>();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Keep status bar transparent
        statusBarIconBrightness: Brightness.dark, // Icons color: dark = black
        statusBarBrightness: Brightness.light, // For iOS: makes text/icons dark
      ),
    );
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthenticationCubit>()),

        BlocProvider(create: (context) => getIt<AppThemeCubit>()),
      ],
      child: BlocBuilder<AppThemeCubit, AppThemeType>(
        builder: (context, theme) {
          return MaterialApp.router(
            // debugShowMaterialGrid: true,
            // checkerboardRasterCacheImages: true,
            // showSemanticsDebugger: true,
            // showPerformanceOverlay: true,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            checkerboardOffscreenLayers: true,
            title: "Template",
            theme: AppTheme().getCurrentThemeFromType(theme), // Use the theme from AppThemeCubit
            debugShowCheckedModeBanner: false,
            routerConfig: _router.config(),
            builder: (context, child) => BlocListener<AuthenticationCubit, AuthenticationState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  authenticated: () {
                    _router.replaceAll([const DashboardRoute()]);
                  },
                  unauthenticated: () {
                    _router.replaceAll([const AuthMainRoute()]);
                  },
                );
              },
              child: child!,
            ),
          );
        },
      ),
    );
  }
}
