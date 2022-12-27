import 'package:ik8_otus_food/src/domain/entities/recipe.dart';

import '../../../domain/repositories/recipe_repository.dart';
import '../../datasources/assets/recipe.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  final AssetRecipeService _service;

  RecipeRepositoryImpl(this._service);

  @override
  List<Recipe> get all => _service.all;

  @override
  void setFavorite(int id,
      {required bool isFavorite, required Function(Recipe recipe) onChange}) {
    _service.setFavorite(id, isFavorite: isFavorite, onChange: onChange);
  }

  @override
  void start(int id,
      {required bool isStarted, required Function(Recipe recipe) onChange}) {
    _service.start(id, isStarted: isStarted, onChange: onChange);
  }
}
