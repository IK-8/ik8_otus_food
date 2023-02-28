import 'dart:async';
import 'package:dio/dio.dart';
import 'package:ik8_otus_food/src/data/models/api/recipe.dart';
import 'package:ik8_otus_food/src/domain/entities/recipe_info.dart';

import '../../../core/service/stream_value.dart';
import '../../../domain/entities/recipe.dart';
import '../../../domain/entities/step.dart';
import 'cache_service.dart';
import 'steps_api_service.dart';

class RecipeApiService {
  final Dio _dio;
  final StepsApiService _stepsApiService;
  final ApiCacheService _cache;

  RecipeApiService(this._dio, this._cache, this._stepsApiService);

  void start(dynamic id,
      {required bool isStarted,
      required Function(Recipe recipe, List<RecipeStep> steps) onChange}) {
    final all = _streamController.value;
    final find = all.firstWhere((element) => element.id == id);
    final index = all.indexOf(find);
    if (isStarted == false) {
      _stepsApiService.setCheckedByRecipe(id, false);
    }
    final copy = find.copyWith(isStarted: isStarted);
    all[index] = copy;
    _streamController.value = all;
    onChange(copy, _stepsApiService.byRecipe(id));
  }

  void setFavorite(dynamic id,
      {required bool isFavorite, required Function(Recipe recipe) onChange}) {
    final all = _streamController.value;
    final find = all.firstWhere((element) => element.id == id);
    final index = all.indexOf(find);
    final copy = find.copyWith(isFavorite: isFavorite);
    all[index] = copy;
    _streamController.value = all;
    onChange(copy);
  }

  Future<void> getRecipeList({
    required Function(List<Recipe> list) onResponse,
    required Function(List<Recipe> list)? onConnectionError,
  }) async {
    try {
      final response = await _dio.get('search.php?s=A');
      List<dynamic> data = (response.data as Map)['meals'];
      final list = data.map((e) => RecipeModel.fromJson(e)).toList();
      _stepsApiService.pushByRecipe(data);
      _cache.setRecipeList(list);
      _streamController.value = list;
      onResponse(list);
    } on DioError catch (_) {
      final list = _cache.getRecipeList();
      _streamController.value = list;
      _stepsApiService.setCached();
      onConnectionError?.call(list);
    }
  }

  late final _streamController = StreamValue<List<Recipe>>([]);

  StreamSubscription<List<Recipe>> subscribeList(
      {required Function(List<Recipe> list) onData}) {
    return _streamController().stream.listen((event) {
      onData(event);
    });
  }

  Recipe _byId(dynamic id) =>
      (_streamController.value).firstWhere((element) => element.id == id);

  RecipeInfo getInfo(id) {
    return RecipeInfo(recipe: _byId(id), steps: _stepsApiService.byRecipe(id));
  }
}
