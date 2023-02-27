import 'package:ik8_otus_food/src/domain/entities/recipe.dart';
import 'package:ik8_otus_food/src/domain/repositories/recipe_repository.dart';

class GetAllRecipeUseCase {
  final RecipeRepository _repository;

  GetAllRecipeUseCase(this._repository);

  List<Recipe> call() {
    return _repository.all;
  }
}
