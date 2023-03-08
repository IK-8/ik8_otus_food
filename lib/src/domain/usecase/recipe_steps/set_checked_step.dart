import 'package:ik8_otus_food/src/domain/entities/step.dart';

import '../../repositories/recipe_repository.dart';

class SetCheckedRecipeStepUseCase {
  final RecipeRepository _repository;

  SetCheckedRecipeStepUseCase(this._repository);

  call(
      {required dynamic id,
      required dynamic recipeId,
      required bool isChecked,
      required Function(List<RecipeStep> recipe) onChange}) {
    _repository.setStepChecked(id,
        recipeId: recipeId, isChecked: isChecked, onChange: onChange);
  }
}
