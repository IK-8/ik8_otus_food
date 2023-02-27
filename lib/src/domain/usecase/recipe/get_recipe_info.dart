import 'package:ik8_otus_food/src/domain/repositories/recipe_repository.dart';

import '../../entities/recipe_info.dart';

class GetRecipeInfoUseCase {
  final RecipeRepository _repository;

  GetRecipeInfoUseCase(this._repository);

  RecipeInfo call(dynamic id) {
    return _repository.infoById(id);
  }
}
