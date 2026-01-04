import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/app_theme/theme_context_extensions.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // // navigate after some delay or initialization
    // Timer(const Duration(seconds: 2), () {
    //   context.router.push(AuthMainRoute());
    // });

    return Scaffold(
      body: Stack(
        children: [
          ColoredBox(
            color: context.theme.primaryColor,
            child: SizedBox(width: .infinity, height: .infinity),
          ),
          Center(child: FlutterLogo(size: 150)),
        ],
      ),
    );
  }
}
