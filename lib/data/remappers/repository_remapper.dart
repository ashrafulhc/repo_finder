import 'package:repo_finder/data/response_objects/repository_response/repository_response.dart';
import 'package:repo_finder/domain/entities/repository_entity/repository_entity.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RepositoryRemapper {
  List<RepositoryEntity> toRepositoryEntities(RepositoryResponse response) {
    if (response.items == null) return [];

    return response.items!.map((item) {
      return RepositoryEntity(
        name: item.name ?? '',
        numberOfStars: item.stargazersCount ?? 0,
        owner: item.owner?.login ?? 'Unknown',
      );
    }).toList();
  }
}
