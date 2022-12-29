import 'package:ik8_otus_food/src/core/bloc/bloc.dart';
import 'package:ik8_otus_food/src/domain/entities/recipe_info.dart';
import 'package:ik8_otus_food/src/domain/usecase/recipe_steps/by_recipe.dart';

import '../../../domain/entities/recipe.dart';
import '../../../domain/usecase/recipe/set_favorite.dart';
import '../../../domain/usecase/recipe/start.dart';
import '../../../domain/usecase/recipe_steps/set_checked_step.dart';

class RecipeInfoCubit extends RequestStateCubit<RecipeInfo> {
  final int id;
  final GetAllRecipeStepUseCase _getSteps;
  final SetFavoriteRecipeUseCase _setFavorite;
  final SetCheckedRecipeStepUseCase _checkStep;
  final StartRecipeUseCase _start;

  RecipeInfoCubit(
    this._getSteps,
    this._checkStep,
    this._start,
    this._setFavorite, {
    required Recipe data,
  })  : id = data.id,
        super(RequestStateInfo.full(RecipeInfo(recipe: data))) {
    refreshSteps();
  }

  changeFavorite(bool isFavorite) {
    emit(state.setOperationLoading());
    _setFavorite.call(
      id: id,
      isFavorite: isFavorite,
      onChange: (changed) {
        emit(state.updateData((data) => data?.copyWith(recipe: changed)));
      },
    );
  }

  refreshSteps() {
    final list = _getSteps(id);
    emit(state.updateData((data) => data?.copyWith(steps: list)));
  }

  checkStep(int stepId, bool isChecked) {
    emit(state.setOperationLoading());
    _checkStep(
        id: stepId,
        recipeId: id,
        isChecked: isChecked,
        onChange: (steps) {
          emit(state.updateData((data) => data?.copyWith(steps: steps)));
        });
  }

  start(bool isStarted) {
    emit(state.setOperationLoading());
    _start(
        id: id,
        isStarted: isStarted,
        onChange: (recipe, steps) {
          emit(state.setFull(RecipeInfo(recipe: recipe, steps: steps)));
        });
  }
}
