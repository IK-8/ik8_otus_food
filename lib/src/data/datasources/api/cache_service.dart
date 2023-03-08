import 'package:hive/hive.dart';
import 'package:ik8_otus_food/src/data/models/local/recipe.dart';
import 'package:ik8_otus_food/src/data/models/local/step.dart';
import 'package:ik8_otus_food/src/domain/entities/step.dart';

import '../../../domain/entities/recipe.dart';
import '../../models/local/ingredient.dart';

class ApiCacheService {
  final Box<LocalRecipe> _recipeBox;
  final Box<LocalRecipeStep> _recipeStepsBox;

  ApiCacheService(this._recipeBox, this._recipeStepsBox);

  static Future<ApiCacheService> init() async {
    return ApiCacheService(
      await Hive.openBox('recipe'),
      await Hive.openBox('step'),
    );
  }

  Future<void> setRecipeList(List<Recipe> list) async {
    await _recipeBox.clear();
    await _recipeBox.addAll(
      list.map(
        (e) => LocalRecipe(
          id: e.id,
          image: e.image,
          title: e.title,
          seconds: e.seconds,
          isFavorite: e.isFavorite,
          isStarted: e.isStarted,
          ingredients: e.ingredients
              .map((e) => LocalRecipeIngredient.byData(e))
              .toList(),
        ),
      ),
    );
  }

  List<LocalRecipe> getRecipeList() => _recipeBox.values.toList();

  Future<void> setRecipeStepList(List<RecipeStep> all) async {
    await _recipeStepsBox.clear();
    await _recipeStepsBox.addAll(
      all.map(
        (e) => LocalRecipeStep(
          id: e.id,
          recipeId: e.recipeId,
          title: e.title,
          seconds: e.seconds,
          isChecked: e.isChecked,
        ),
      ),
    );
  }

  List<LocalRecipeStep> getRecipeStepList() => _recipeStepsBox.values.toList();
}
