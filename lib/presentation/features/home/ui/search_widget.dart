import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repo_finder/presentation/features/home/cubit/home_cubit.dart';
import 'package:repo_finder/presentation/resources/resources.dart';
import 'package:repo_finder/presentation/widgets/text/app_text.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isInvalid =
        context.select((HomeCubit cubit) => cubit.state.queryStatus.isInvalid);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: (value) {
                  context.read<HomeCubit>().setQueryText(value);
                },
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: 'Search Repo',
                  hintStyle: TextStyle(
                    color: context.colors.disabledColor,
                    fontSize: 14,
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                context.read<HomeCubit>().onQuery();
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        if (isInvalid)
          AppText.bodySmall(
            'Query Text length is too short!',
            color: context.colors.danger,
          )
      ],
    );
  }
}
