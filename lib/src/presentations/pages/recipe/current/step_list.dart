import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ik8_otus_food/l10n/extension.dart';

import '../../../blocs/recipe/recipe_info_cubit.dart';
import '../../../widgets/recipe_step/recipe_step_item.dart';

class StepList extends StatelessWidget {
  const StepList({Key? key}) : super(key: key);

  onCheckedStep(BuildContext context, int stepId, bool isChecked) {
    context.read<RecipeInfoCubit>().checkStep(
          stepId,
          isChecked,
        );
  }

  @override
  Widget build(BuildContext context) {
    final steps =
        context.select((RecipeInfoCubit bloc) => bloc.state.data?.steps ?? []);
    final enabled = context.select(
        (RecipeInfoCubit bloc) => bloc.state.data?.recipe.isStarted == true);
    if (steps.isEmpty) {
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.cookingStepsTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 16,
        ),
        for (int i = 0; i < steps.length; i++)
          RecipeStepItem(
            index: i + 1,
            enabled: enabled,
            onSelect: (isSelect) {
              onCheckedStep(context, steps[i].id, isSelect);
            },
            item: steps[i],
          ),
      ],
    );
  }
}
