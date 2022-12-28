import 'package:ik8_otus_food/src/domain/entities/recipe.dart';

import '../../../domain/entities/recipe_info.dart';
import '../../../domain/repositories/recipe_repository.dart';
import '../../datasources/assets/recipe.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  final AssetRecipeService _service;

  RecipeRepositoryImpl(this._service);

  @override
  List<Recipe> get all => _service.all;

  @override
  void setFavorite(
    int id, {
    required bool isFavorite,
    required Function(RecipeInfo recipe) onChange,
  }) {
    _service.setFavorite(id, isFavorite: isFavorite, onChange: onChange);
  }

  @override
  void start(
    int id, {
    required bool isStarted,
    required Function(RecipeInfo recipe) onChange,
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
    required Function(RecipeInfo recipe) onChange,
  }) {
    return _service.setStepChecked(id,
        recipeId: recipeId, isChecked: isChecked, onChange: onChange);
  }

  @override
  void createComment({
    required int recipeId,
    required String text,
    required Function(RecipeInfo recipe) onChange,
  }) {
    return _service.create(recipeId: recipeId, text: text, onChange: onChange);
  }
}
