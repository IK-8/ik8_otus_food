import 'package:ik8_otus_food/src/domain/entities/step.dart';
import 'package:ik8_otus_food/src/domain/repositories/recipe_repository.dart';

class GetAllRecipeStepUseCase {
  final RecipeRepository _repository;

  GetAllRecipeStepUseCase(this._repository);

  List<RecipeStep> call(int recipeId) {
    return _repository.recipeSteps(recipeId);
  }
}
