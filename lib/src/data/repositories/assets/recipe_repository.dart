import 'package:ik8_otus_food/src/data/datasources/assets/steps.dart';
import 'package:ik8_otus_food/src/domain/entities/recipe.dart';
import 'package:ik8_otus_food/src/domain/entities/step.dart';

import '../../../domain/entities/comment.dart';
import '../../../domain/entities/recipe_info.dart';
import '../../../domain/repositories/recipe_repository.dart';
import '../../datasources/assets/recipe.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  final AssetRecipeService _service;
  final AssetRecipeStepService _stepService;

  RecipeRepositoryImpl(this._service, this._stepService);

  @override
  List<Recipe> get all => _service.all;

  @override
  void setFavorite(
    int id, {
    required bool isFavorite,
    required Function(Recipe recipe) onChange,
  }) {
    _service.setFavorite(id, isFavorite: isFavorite, onChange: onChange);
  }

  @override
  void start(
    int id, {
    required bool isStarted,
    required Function(Recipe recipe, List<RecipeStep> steps) onChange,
  }) {
    _service.start(id, isStarted: isStarted, onChange: onChange);
  }

  @override
  RecipeInfo infoById(int id) {
    return _service.getInfo(id);
  }

  @override
  void setStepChecked(
    int id, {
    required int recipeId,
    required bool isChecked,
    required Function(List<RecipeStep> steps) onChange,
  }) {
    return _stepService.setStepChecked(
      id,
      isChecked: isChecked,
      onChange: onChange,
    );
  }

  @override
  List<RecipeStep> recipeSteps(int recipeId) {
    return _stepService.byRecipe(recipeId);
  }
}
