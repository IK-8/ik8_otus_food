import '../../entities/recipe.dart';
import '../../entities/recipe_info.dart';
import '../../repositories/recipe_repository.dart';

class SetFavoriteRecipeUseCase {
  final RecipeRepository _repository;

  SetFavoriteRecipeUseCase(this._repository);

  call(
      {required int id,
      required bool isFavorite,
      required Function(RecipeInfo recipe) onChange}) {
    _repository.setFavorite(id, isFavorite: isFavorite, onChange: onChange);
  }
}
