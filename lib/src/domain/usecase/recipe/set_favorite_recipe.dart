import '../../entities/recipe.dart';
import '../../repositories/recipe_repository.dart';

class SetFavoriteRecipeUseCase {
  final RecipeRepository _repository;

  SetFavoriteRecipeUseCase(this._repository);

  call(
      {required dynamic id,
      required bool isFavorite,
      required Function(Recipe recipe) onChange}) {
    _repository.setFavorite(id, isFavorite: isFavorite, onChange: onChange);
  }
}
