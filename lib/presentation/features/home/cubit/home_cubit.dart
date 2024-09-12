import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repo_finder/data/response_objects/response_error.dart';
import 'package:repo_finder/domain/entities/repository_entity/repository_entity.dart';
import 'package:repo_finder/domain/usecases/repository/get_repositories_use_case.dart';
import 'package:repo_finder/domain/common/base_status/base_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._getRepositoriesUseCase,
  ) : super(const HomeState());

  final GetRepositoriesUseCase _getRepositoriesUseCase;

  Future<void> getRepositories() async {
    if (state.initStatus.isLoading) {
      return;
    }

    if (state.hasMore == false) {
      emit(
        state.copyWith(
          initStatus: const BaseStatus.failure(
            ResponseError.noMoreData(),
          ),
        ),
      );
      return;
    }

    try {
      log('fetching repositories...');

      emit(state.copyWith(initStatus: const BaseStatus.loading()));

      final result = await _getRepositoriesUseCase.run(
        queryText: state.queryText,
        currentPage: state.currentPage,
      );

      if (isClosed) {
        return;
      }

      final hasMore = result.length == 10;

      final newRepositoriesAfterFetching = [
        ...state.repositoryEntities,
        ...result,
      ];

      emit(
        state.copyWith(
          currentPage: state.currentPage + 1,
          initStatus: const BaseStatus.success(),
          repositoryEntities: newRepositoriesAfterFetching,
          hasMore: hasMore,
        ),
      );
      log('Successfuly Fetched');
    } catch (e, s) {
      if (isClosed) {
        return;
      }

      log('Unable to fetch. Failure message $e ---- $s');
      final error = ResponseError.from(e);
      emit(state.copyWith(initStatus: BaseStatus.failure(error)));
    }
  }

  Future<void> onQuery() async {
    if (state.queryStatus.isLoading || state.initStatus.isLoading) {
      return;
    }

    if (state.queryText.length < 3) {
      emit(
        state.copyWith(
          queryStatus: const BaseStatus.invalid(),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        queryStatus: const BaseStatus.loading(),
        currentPage: 0,
        hasMore: true,
        repositoryEntities: [],
      ),
    );

    await getRepositories();

    emit(state.copyWith(queryStatus: const BaseStatus.success()));
  }

  void setQueryText(String value) {
    emit(state.copyWith(queryText: value));
    _validateQueryText(value);
  }

  void _validateQueryText(String value) {
    if (value.length > 2) {
      emit(state.copyWith(queryStatus: const BaseStatus.valid()));
    } else {
      emit(state.copyWith(queryStatus: const BaseStatus.valid()));
    }
  }
}
