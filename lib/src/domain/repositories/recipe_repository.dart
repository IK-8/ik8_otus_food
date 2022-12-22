import '../entities/recipe.dart';

abstract class RecipeRepository {
  List<Recipe> get all;
}