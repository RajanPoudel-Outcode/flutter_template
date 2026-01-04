import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/routes/app_routes.gr.dart';
import 'package:injectable/injectable.dart';

@injectable
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // Splash screen - instant navigation
    AutoRoute(page: SplashRoute.page, path: '/', initial: true, keepHistory: false),

    // AutoRoute(page: ProfileRoute.page, path: '/', initial: true, keepHistory: false),
  ];
}

class SlideTransitionBuilder extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  const SlideTransitionBuilder({super.key, required this.child, required this.animation});

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation.drive(
        Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.ease)),
      ),
      child: child,
    );
  }
}
