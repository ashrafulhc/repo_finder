import 'package:repo_finder/domain/entities/repository_entity/repository_entity.dart';
import 'package:repo_finder/domain/services/repository/repository_service.dart';
import 'package:injectable/injectable.dart';

@injectable
final class GetRepositoriesUseCase {
  final RepositoryService _repositoryService;

  GetRepositoriesUseCase(this._repositoryService);

  Future<List<RepositoryEntity>> run({
    required String queryText,
    required int currentPage,
  }) async {
    return _repositoryService.getRepositories(queryText, currentPage);
  }
}
