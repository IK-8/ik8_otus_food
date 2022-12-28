import '../../entities/recipe.dart';
import '../../entities/recipe_info.dart';
import '../../repositories/recipe_repository.dart';

class CreateRecipeCommentUseCase {
  final RecipeRepository _repository;

  CreateRecipeCommentUseCase(this._repository);

  call(
      {required int recipeId,
      required String text,
      required Function(RecipeInfo recipe) onChange}) {
    _repository.createComment(
        recipeId: recipeId, text: text, onChange: onChange);
  }
}
