import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repo_finder/domain/entities/repository_entity/repository_entity.dart';
import 'package:repo_finder/presentation/features/home/cubit/home_cubit.dart';
import 'package:repo_finder/presentation/routes/router.gr.dart';
import 'package:repo_finder/presentation/widgets/text/app_text.dart';

class RepositoryListView extends StatefulWidget {
  const RepositoryListView({
    super.key,
    required this.repositoryEntities,
  });

  final List<RepositoryEntity> repositoryEntities;

  @override
  State<RepositoryListView> createState() => _RepositoryListViewState();
}

class _RepositoryListViewState extends State<RepositoryListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<HomeCubit>().getRepositories();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.select((HomeCubit cubit) => cubit.state.initStatus.isLoading);

    if (widget.repositoryEntities.isEmpty && !isLoading) {
      return const Text('No Data');
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.repositoryEntities.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Material(
            color: Colors.transparent,
            child: ListTile(
              title: AppText.header2(widget.repositoryEntities[index].name),
              subtitle: Text(widget.repositoryEntities[index].owner),
              trailing:
                  Text('⭐ ${widget.repositoryEntities[index].numberOfStars}'),
              onTap: () {
                context.pushRoute(RepositoryDetailsRoute(
                    repositoryEntity: widget.repositoryEntities[index]));
              },
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        );
      },
    );
  }
}
