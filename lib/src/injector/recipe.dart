import 'package:get_it/get_it.dart';
import 'package:ik8_otus_food/src/data/datasources/assets/recipe.dart';
import 'package:ik8_otus_food/src/data/repositories/assets/recipe_repository.dart';
import 'package:ik8_otus_food/src/domain/repositories/recipe_repository.dart';

Future<void> initializeRecipe(GetIt injector) async {
  try {
    injector.registerSingleton(AssetRecipeService());
    injector
        .registerSingleton<RecipeRepository>(RecipeRepositoryImpl(injector()));
  } catch (_) {}
}
