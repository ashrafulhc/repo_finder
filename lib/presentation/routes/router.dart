import 'package:auto_route/auto_route.dart';
import 'package:repo_finder/presentation/routes/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: '/',
          initial: true,
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
        ),
        AutoRoute(
          page: RepositoryDetailsRoute.page,
          path: '/repository_details',
        ),
      ];
}
