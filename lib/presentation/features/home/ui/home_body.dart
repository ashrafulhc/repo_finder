import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repo_finder/presentation/features/home/cubit/home_cubit.dart';
import 'package:repo_finder/presentation/features/home/ui/home_bloc_listener.dart';
import 'package:repo_finder/presentation/features/home/ui/repository_list_view.dart';
import 'package:repo_finder/presentation/features/home/ui/search_widget.dart';
import 'package:repo_finder/presentation/resources/app_ui_constants.dart';
import 'package:repo_finder/presentation/widgets/loading_indicator/app_loading_indicator.dart';
import 'package:repo_finder/presentation/widgets/utilities/app_screen_config.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.select((HomeCubit cubit) => cubit.state.initStatus.isLoading);

    final isQueryLoading =
        context.select((HomeCubit cubit) => cubit.state.queryStatus.isLoading);

    final repositoryEntities =
        context.select((HomeCubit cubit) => cubit.state.repositoryEntities);

    return HomeBlocListener(
      child: AppScreenConfig(
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: AppUiConstants.defaultScreenPadding,
              child: Column(
                children: [
                  const SearchWidget(),
                  const SizedBox(height: 20),
                  isQueryLoading
                      ? const Center(
                          child: AppLoadingIndicator(),
                        )
                      : Expanded(
                          child: RepositoryListView(
                            repositoryEntities: repositoryEntities,
                          ),
                        ),
                  if (isLoading && !isQueryLoading)
                    const SizedBox(
                      height: 24,
                      child: AppLoadingIndicator(),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
