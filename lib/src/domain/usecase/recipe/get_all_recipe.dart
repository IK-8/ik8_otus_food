import 'package:ik8_otus_food/src/domain/entities/recipe.dart';
import 'package:ik8_otus_food/src/domain/repositories/recipe_repository.dart';

class GetAllRecipeUseCase {
  final RecipeRepository _repository;

  GetAllRecipeUseCase(this._repository);

  void call({
    required Function(List<Recipe> list) onResponse,
    required Function(String? error) onError,
  }) {
    return _repository.getAll(
      onResponse: onResponse,
      onError: onError,
    );
  }
}
