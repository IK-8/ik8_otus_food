import 'package:ik8_otus_food/src/data/models/api/step.dart';

import '../../../domain/entities/step.dart';
import 'cache_service.dart';

class StepsApiService {
  final ApiCacheService _cache;

  StepsApiService(this._cache);

  final List<RecipeStep> _all = [];

  int localId = 0;

  void pushByRecipe(List<dynamic> list) {
    _all.clear();
    for (Map<String, dynamic> recipe in list) {
      final newList = RecipeStepModel.fromRecipe(recipe, localId);
      _all.addAll(newList);
      localId += newList.length;
    }
    _cache.setRecipeStepList(_all);
  }

  void setCached() async {
    _all.addAll(_cache.getRecipeStepList());
  }

  void setCheckedByRecipe(dynamic recipeId, bool isChecked) {
    for (var i = 0; i < _all.length; i++) {
      var item = _all[i];
      if (item.recipeId == recipeId) {
        _all[i] = item.copyWith(isChecked: isChecked);
      }
    }
  }

  void setChecked(dynamic id, bool isChecked) {
    for (var i = 0; i < _all.length; i++) {
      var item = _all[i];
      if (item.id == id) {
        _all[i] = item.copyWith(isChecked: isChecked);
        return;
      }
    }
  }

  List<RecipeStep> byRecipe(dynamic recipeId) =>
      _all.where((element) => element.recipeId == recipeId).toList();

  void setStepChecked(
    dynamic id, {
    required bool isChecked,
    required Function(List<RecipeStep> steps) onChange,
  }) {
    for (var i = 0; i < _all.length; i++) {
      var item = _all[i];
      if (item.id == id) {
        _all[i] = item.copyWith(isChecked: isChecked);
        onChange(byRecipe(item.recipeId));
      }
    }
  }
}
