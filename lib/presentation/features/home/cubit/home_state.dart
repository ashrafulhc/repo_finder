part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<RepositoryEntity> repositoryEntities,
    @Default(0) int currentPage,
    @Default(true) bool hasMore,
    @Default('') String queryText,
    @Default(BaseStatus.initial()) BaseStatus initStatus,
    @Default(BaseStatus.initial()) BaseStatus queryStatus,
  }) = _HomeState;
}
