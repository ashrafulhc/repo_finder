import 'package:repo_finder/domain/entities/repository_entity/repository_entity.dart';

abstract interface class RepositoryService {
  Future<List<RepositoryEntity>> getRepositories(
    String queryText,
    int currentPage,
  );
}
