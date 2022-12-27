import '../../entities/recipe.dart';
import '../../repositories/recipe_repository.dart';

class StartRecipeUseCase {
  final RecipeRepository _repository;

  StartRecipeUseCase(this._repository);

  call(
      {required int id,
      required bool isStarted,
      required Function(Recipe recipe) onChange}) {
    _repository.start(id, isStarted: isStarted, onChange: onChange);
  }
}
