import 'package:ik8_otus_food/src/domain/entities/recipe.dart';

import '../../../domain/repositories/recipe_repository.dart';
import '../../datasources/assets/recipe.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  final AssetRecipeService _service;

  RecipeRepositoryImpl(this._service);

  @override
  List<Recipe> get all => _service.all;
}
