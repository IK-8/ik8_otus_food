import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../l10n/extension.dart';
import '../../../blocs/recipe/recipe_info_cubit.dart';
import '../../../widgets/ingredient/ingredient.dart';

class IngredientsList extends StatelessWidget {
  const IngredientsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ingredients = context.select(
        (RecipeInfoCubit bloc) => bloc.state.data?.recipe.ingredients ?? []);
    if (ingredients.isEmpty) {
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.ingredientsTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: IngredientTable(
            list: ingredients,
          ),
        )
      ],
    );
  }
}
