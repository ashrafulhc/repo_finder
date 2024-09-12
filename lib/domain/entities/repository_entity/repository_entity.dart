import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_entity.freezed.dart';
part 'repository_entity.g.dart';

@freezed
class RepositoryEntity with _$RepositoryEntity {
  const factory RepositoryEntity({
    required String name,
    required int numberOfStars,
    required String owner,
  }) = _RepositoryEntity;

  factory RepositoryEntity.fromJson(Map<String, dynamic> json) =>
      _$RepositoryEntityFromJson(json);
}
