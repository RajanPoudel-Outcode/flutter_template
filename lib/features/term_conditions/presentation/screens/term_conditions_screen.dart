import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/injection/injection.dart';
import 'package:flutter_template/features/term_conditions/presentation/cubit/term_conditions_cubit.dart';

@RoutePage()
class TermConditionsScreen extends StatelessWidget {
  const TermConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TermConditionsCubit>()..fetchTermConditionsData(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TermConditions'),
        ),
        body: BlocBuilder<TermConditionsCubit,TermConditionsState>(
          builder: (context, state) {
           return state.map(
              initial: (_) => const SizedBox.shrink(),
              loading: (_) => const Center(child: CircularProgressIndicator()),
              success: (state) =>
                  Center(child: Text(state.termConditionsEntity.toString())),
              error: (state) => Center(child: Text(state.error)),
            );
          },
        ),
      ),
    );
  }
}
