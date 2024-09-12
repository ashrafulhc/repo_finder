import 'package:repo_finder/data/remappers/repository_remapper.dart';
import 'package:repo_finder/data/services/repository/source/remote/repository_remote_data_source.dart';
import 'package:repo_finder/domain/entities/repository_entity/repository_entity.dart';
import 'package:repo_finder/domain/services/repository/repository_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RepositoryService)
class RepositoryServiceImpl implements RepositoryService {
  final RepositoryRemoteDataSource _repositoryRemoteDataSource;
  final RepositoryRemapper _remapper;

  RepositoryServiceImpl(
    this._repositoryRemoteDataSource,
    this._remapper,
  );

  @override
  Future<List<RepositoryEntity>> getRepositories(
    String queryText,
    int currentPage,
  ) async {
    final response = await _repositoryRemoteDataSource.getRepositories(
      queryText,
      'stars',
      'desc',
      10,
      currentPage + 1,
    );
    final repositoryEntities = _remapper.toRepositoryEntities(response);
    return repositoryEntities;
  }
}
