import 'package:repo_finder/presentation/app/app_flavor.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiConfig {
  final AppFlavor flavor;

  ApiConfig(this.flavor);

  String get baseUrl => switch (flavor) {
        AppFlavor.development => 'https://api.github.com',
        AppFlavor.staging => 'https://api.github.com',
        AppFlavor.production => 'https://api.github.com',
      };
}
