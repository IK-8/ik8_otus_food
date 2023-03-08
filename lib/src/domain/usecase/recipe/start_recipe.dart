import 'package:ik8_otus_food/src/domain/entities/step.dart';

import '../../entities/recipe.dart';
import '../../repositories/recipe_repository.dart';

class StartRecipeUseCase {
  final RecipeRepository _repository;

  StartRecipeUseCase(this._repository);

  call(
      {required dynamic id,
      required bool isStarted,
      required Function(Recipe recipe, List<RecipeStep> steps) onChange}) {
    _repository.start(id, isStarted: isStarted, onChange: onChange);
  }
}
