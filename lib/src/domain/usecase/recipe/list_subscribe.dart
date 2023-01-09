import 'dart:async';

import 'package:ik8_otus_food/src/domain/entities/recipe.dart';
import 'package:ik8_otus_food/src/domain/repositories/recipe_repository.dart';

import '../../entities/recipe_info.dart';

class SubscribeRecipeListUseCase {
  final RecipeRepository _repository;

  SubscribeRecipeListUseCase(this._repository);

  StreamSubscription<List<Recipe>> call(
      {required Function(List<Recipe> list) onData}) {
    return _repository.subscribeList(onData: onData);
  }
}
