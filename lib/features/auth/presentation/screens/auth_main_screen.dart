import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/app_theme/theme_context_extensions.dart';
import 'package:flutter_template/core/utils/extensions/ui_extension.dart';

@RoutePage()
class AuthMainScreen extends StatelessWidget {
  const AuthMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: .topCenter,
        children: [
          // Image.asset(Images.background, width: .infinity, height: .infinity, fit: .cover),
          ColoredBox(
            color: context.theme.primaryColor,
            child: SizedBox(width: .infinity, height: .infinity),
          ),
          Column(
            mainAxisAlignment: .start,
            children: [
              (MediaQuery.sizeOf(context).height * 0.1).verticalBox,

              FlutterLogo(size: 100),

              Spacer(flex: 1),
              IntrinsicHeight(
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: 8.rounded),
                  child: const AutoRouter(),
                ).px(20),
              ),
              Spacer(flex: 2),
            ],
          ),
        ],
      ),
    );
  }
}
