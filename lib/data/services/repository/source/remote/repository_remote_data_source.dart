import 'package:dio/dio.dart';
import 'package:repo_finder/data/response_objects/repository_response/repository_response.dart';
import 'package:repo_finder/injection/network_module.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'repository_remote_data_source.g.dart';

@RestApi()
@lazySingleton
abstract class RepositoryRemoteDataSource {
  @factoryMethod
  factory RepositoryRemoteDataSource(
    @Named(dioClient) Dio dio,
  ) = _RepositoryRemoteDataSource;

  @GET('/search/repositories')
  Future<RepositoryResponse> getRepositories(
      @Query('q') String query,
      @Query('sort') String sort,
      @Query('order') String order,
      @Query('per_page') int perPage,
      @Query('page') int page);
}
