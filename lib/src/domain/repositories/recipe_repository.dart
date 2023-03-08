import 'dart:async';

import 'package:ik8_otus_food/src/domain/entities/step.dart';

import '../../core/service/timer_service.dart';
import '../entities/recipe.dart';
import '../entities/recipe_info.dart';

abstract class RecipeRepository {
  // List<Recipe> get all;
  void getAll({

    required Function(List<Recipe> list) onResponse,
    required Function(String? error) onError,
  });

  // List<Recipe>

  StreamSubscription<List<Recipe>> subscribeList(
      {required Function(List<Recipe> list) onData});

  void setFavorite(
      dynamic id, {
    required bool isFavorite,
    required Function(Recipe recipe) onChange,
  });

  void start(
      dynamic id, {
    required bool isStarted,
    required Function(Recipe recipe, List<RecipeStep> steps) onChange,
  });

  RecipeInfo infoById(dynamic id);

  void setStepChecked(
    dynamic id, {
    required dynamic recipeId,
    required bool isChecked,
    required Function(List<RecipeStep> steps) onChange,
  });

  List<RecipeStep> recipeSteps(dynamic recipeId);

  StreamSubscription<bool> subscribeActiveTimer({
    required dynamic recipeId,
    required void Function(TimerService? activeService) onChange,
  });
}
