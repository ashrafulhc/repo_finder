import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repo_finder/data/response_objects/response_error.dart';
import 'package:repo_finder/presentation/features/home/cubit/home_cubit.dart';
import 'package:repo_finder/presentation/resources/resources.dart';
import 'package:repo_finder/presentation/widgets/text/app_text.dart';

class HomeBlocListener extends StatelessWidget {
  const HomeBlocListener({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        state.initStatus.whenOrNull(
          failure: (error) {
            final message = error.getErrorMessage();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: AppText.bodySmall(
                  message,
                  color: context.colors.foregroundOnPrimary,
                ),
              ),
            );
          },
        );
      },
      child: child,
    );
  }
}
