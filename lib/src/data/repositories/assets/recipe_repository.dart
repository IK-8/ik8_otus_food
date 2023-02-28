import 'dart:async';

import 'package:ik8_otus_food/src/domain/entities/recipe.dart';
import 'package:ik8_otus_food/src/domain/entities/step.dart';

import '../../../core/service/recipe/recipe_timer_service.dart';
import '../../../domain/entities/recipe_info.dart';
import '../../../domain/repositories/recipe_repository.dart';
import '../../datasources/api/recipe_api_service.dart';
import '../../datasources/api/steps_api_service.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  final RecipeTimerService _timerService;
  final RecipeApiService _api;
  final StepsApiService _stepsApi;

  RecipeRepositoryImpl(
    this._timerService,
    this._api,
    this._stepsApi,
  );

  @override
  void getAll({
    required Function(List<Recipe> list) onResponse,
  }) {
    _api.getRecipeList(
      onResponse: (list) {
        onResponse(list);
      },
      onConnectionError: (cache) {
        onResponse(cache);
      },
    );
  }

  @override
  void setFavorite(
    dynamic id, {
    required bool isFavorite,
    required Function(Recipe recipe) onChange,
  }) {
    _api.setFavorite(id, isFavorite: isFavorite, onChange: onChange);
  }

  @override
  void start(
    dynamic id, {
    required bool isStarted,
    required Function(Recipe recipe, List<RecipeStep> steps) onChange,
  }) {
    _api.start(
      id,
      isStarted: isStarted,
      onChange: (recipe, steps) {
        if (recipe.isStarted) {
          _timerService.start(id, recipe.seconds);
        } else {
          _timerService.stop(id);
        }
        onChange(recipe, steps);
      },
    );
  }

  @override
  RecipeInfo infoById(dynamic id) {
    return _api.getInfo(id);
  }

  @override
  void setStepChecked(
    dynamic id, {
    required dynamic recipeId,
    required bool isChecked,
    required Function(List<RecipeStep> steps) onChange,
  }) {
    return _stepsApi.setStepChecked(
      id,
      isChecked: isChecked,
      onChange: onChange,
    );
  }

  @override
  List<RecipeStep> recipeSteps(dynamic recipeId) {
    return _stepsApi.byRecipe(recipeId);
  }

  @override
  StreamSubscription<List<Recipe>> subscribeList(
      {required Function(List<Recipe> list) onData}) {
    return _api.subscribeList(onData: onData);
  }

  @override
  StreamSubscription<bool> subscribeActiveTimer({
    required dynamic recipeId,
    required void Function(TimerService? activeService) onChange,
  }) {
    onChange(_timerService.idTimerMap[recipeId]);
    return _timerService
        .idsValue()
        .stream
        .map((ids) => ids.contains(recipeId))
        .listen(
      (isActive) {
        onChange(_timerService.idTimerMap[recipeId]);
      },
    );
  }
}
