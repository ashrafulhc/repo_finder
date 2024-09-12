import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repo_finder/injection/injector.dart';
import 'package:repo_finder/presentation/resources/resources.dart';
import 'package:repo_finder/presentation/routes/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = injector.get<AppRouter>();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.fromBrightness(Brightness.light),
      darkTheme: AppTheme.fromBrightness(Brightness.dark),
      // TODO: Set to [ThemeMode.light] if your app only supports light mode
      themeMode: ThemeMode.system,
      title: 'Repo Finder',

      routerDelegate: AutoRouterDelegate(
        appRouter,
      ),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
