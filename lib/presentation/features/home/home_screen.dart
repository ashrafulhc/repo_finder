import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repo_finder/injection/injector.dart';
import 'package:repo_finder/presentation/features/home/cubit/home_cubit.dart';
import 'package:repo_finder/presentation/features/home/ui/home_body.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => injector(),
      child: const HomeBody(),
    );
  }
}
