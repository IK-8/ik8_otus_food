import 'dart:async';

import 'package:ik8_otus_food/src/domain/entities/step.dart';

import '../../core/service/timer_service.dart';
import '../entities/recipe.dart';
import '../entities/recipe_info.dart';

abstract class RecipeRepository {
  List<Recipe> get all;

  StreamSubscription<List<Recipe>> subscribeList(
      {required Function(List<Recipe> list) onData});

  void setFavorite(
    int id, {
    required bool isFavorite,
    required Function(Recipe recipe) onChange,
  });

  void start(
    int id, {
    required bool isStarted,
    required Function(Recipe recipe, List<RecipeStep> steps) onChange,
  });

  RecipeInfo infoById(int id);

  void setStepChecked(
    int id, {
    required int recipeId,
    required bool isChecked,
    required Function(List<RecipeStep> steps) onChange,
  });

  List<RecipeStep> recipeSteps(int recipeId);

  StreamSubscription<bool> subscribeActiveTimer({
    required int recipeId,
    required void Function(TimerService? activeService) onChange,
  });
}
