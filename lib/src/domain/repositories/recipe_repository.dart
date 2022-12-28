import '../entities/recipe.dart';
import '../entities/recipe_info.dart';

abstract class RecipeRepository {
  List<Recipe> get all;

  void setFavorite(int id,
      {required bool isFavorite,
      required Function(RecipeInfo recipe) onChange});

  void start(int id,
      {required bool isStarted, required Function(RecipeInfo recipe) onChange});

  RecipeInfo infoById(int id);

  void setStepChecked(int id,
      {required int recipeId,
      required bool isChecked,
      required Function(RecipeInfo recipe) onChange});

  void createComment(
      {required int recipeId,
        required String text,
        required Function(RecipeInfo recipe) onChange});
}
