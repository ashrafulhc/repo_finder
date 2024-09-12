import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repo_finder/domain/entities/repository_entity/repository_entity.dart';
import 'package:repo_finder/presentation/resources/app_ui_constants.dart';
import 'package:repo_finder/presentation/widgets/text/app_text.dart';

@RoutePage()
class RepositoryDetailsPage extends StatelessWidget {
  const RepositoryDetailsPage({
    super.key,
    required this.repositoryEntity,
  });

  final RepositoryEntity repositoryEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repository Details'),
      ),
      body: Padding(
        padding: AppUiConstants.defaultScreenPadding,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              AppText.header1(
                'Repository Name: ${repositoryEntity.name}',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              AppText.header3('Repository Owner: ${repositoryEntity.owner}'),
              const SizedBox(height: 20),
              AppText.bodyLarge(
                  'Total Stars: ⭐ ${repositoryEntity.numberOfStars}'),
            ],
          ),
        ),
      ),
    );
  }
}
