import 'dart:async';

import 'package:ik8_otus_food/src/domain/repositories/recipe_repository.dart';

import '../../../core/service/timer_service.dart';

class SubscribeRecipeTimerUseCase {
  final RecipeRepository _repository;

  SubscribeRecipeTimerUseCase(this._repository);

  StreamSubscription<bool> call({
    required dynamic recipeId,
    required Function(TimerService? active) onChange,
  }) {
    return _repository.subscribeActiveTimer(
      recipeId: recipeId,
      onChange: onChange,
    );
  }
}
