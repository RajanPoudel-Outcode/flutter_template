// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter_template/features/splash/presentation/screen/splash_screen.dart'
    as _i1;
import 'package:flutter_template/features/term_conditions/presentation/screens/term_conditions_screen.dart'
    as _i2;

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i3.PageRouteInfo<void> {
  const SplashRoute({List<_i3.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.SplashScreen();
    },
  );
}

/// generated route for
/// [_i2.TermConditionsScreen]
class TermConditionsRoute extends _i3.PageRouteInfo<void> {
  const TermConditionsRoute({List<_i3.PageRouteInfo>? children})
    : super(TermConditionsRoute.name, initialChildren: children);

  static const String name = 'TermConditionsRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.TermConditionsScreen();
    },
  );
}
