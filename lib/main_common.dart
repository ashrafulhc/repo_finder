import 'package:flutter/material.dart';
import 'package:repo_finder/presentation/app/app.dart';
import 'package:repo_finder/presentation/app/app_flavor.dart';
import 'package:repo_finder/injection/dependencies.dart';

Future<void> mainCommon(AppFlavor flavor) async {
  await DependencyManager.inject(flavor);
  // Bloc Observer needs to be added here
  runApp(const App());
}
