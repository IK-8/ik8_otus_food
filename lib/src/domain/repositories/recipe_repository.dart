import '../entities/recipe.dart';

abstract class RecipeRepository {
  List<Recipe> get all;

  void setFavorite(int id,
      {required bool isFavorite, required Function(Recipe recipe) onChange});

  void start(int id,
      {required bool isStarted, required Function(Recipe recipe) onChange});
}
