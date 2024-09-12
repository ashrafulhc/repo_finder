import 'package:repo_finder/presentation/app/app_flavor.dart';
import 'package:repo_finder/injection/injector.dart';
import 'package:repo_finder/presentation/routes/router.dart';

class DependencyManager {
  static Future<void> inject(AppFlavor flavor) async {
    injector.registerLazySingleton<AppFlavor>(() => flavor);
    injector.registerLazySingleton<AppRouter>(() => AppRouter());

    await configureDependencies();
  }
}
