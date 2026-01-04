import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/app_theme/colors.dart';
import 'package:flutter_template/core/app_theme/theme_context_extensions.dart';
import 'package:flutter_template/core/routes/app_routes.gr.dart';
import 'package:flutter_template/core/utils/extensions/context_extension.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [HomeRoute(), ProfileRoute()],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child, // the passed child is the animated selected-tab page
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            flexibleSpace: Column(
              mainAxisAlignment: .end,
              children: [
                Text(
                  context.l10n.appName.toUpperCase(),
                  style: context.textTheme.headlineLarge?.copyWith(
                    color: AppColors.secondary,
                    letterSpacing: 2,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          body: child,
          bottomNavigationBar: Material(
            elevation: 2,
            child: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
              ),
              child: BottomNavigationBar(
                type: .fixed,
                backgroundColor: context.theme.primaryColor,
                currentIndex: tabsRouter.activeIndex,
                onTap: (index) {
                  if (index == 2) return;
                  tabsRouter.setActiveIndex(index);
                },
                showUnselectedLabels: true,
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
