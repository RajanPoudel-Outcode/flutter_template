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
    // Auth routes
    CustomRoute(
      page: AuthMainRoute.page,
      path: '/auth',
      transitionsBuilder: TransitionsBuilders.slideLeft,

      children: [
        CustomRoute(
          page: LoginRoute.page,
          path: 'login',
          initial: true,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        // CustomRoute(
        //   page: SignupRoute.page,
        //   path: 'sign-up',
        //   barrierDismissible: false,
        //   transitionsBuilder: TransitionsBuilders.slideLeft,
        // ),

        // CustomRoute(
        //   page: ResetPasswordRoute.page,
        //   path: 'reset-password',
        //   barrierDismissible: false,
        //   transitionsBuilder: TransitionsBuilders.slideLeft,
        // ),
      ],
    ),
    AutoRoute(
      page: DashboardRoute.page,
      path: '/dashboard',
      children: [
        CustomRoute(
          page: HomeRoute.page,
          initial: true,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(page: ProfileRoute.page, transitionsBuilder: TransitionsBuilders.slideLeft),
      ],
    ),
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
