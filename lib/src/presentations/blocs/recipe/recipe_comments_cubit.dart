import 'package:ik8_otus_food/src/core/bloc/bloc.dart';
import 'package:ik8_otus_food/src/domain/usecase/recipe_comments/create_recipe_comment.dart';

import '../../../domain/entities/comment.dart';
import '../../../domain/usecase/recipe_comments/get_all_comments_by_recipe.dart';

class RecipeCommentsCubit extends RequestStateCubit<List<RecipeComment>> {
  final dynamic recipeId;
  final GetAllCommentsByRecipeUseCase _get;
  final CreateRecipeCommentUseCase _create;

  RecipeCommentsCubit(
    this._get,
    this._create, {
    required this.recipeId,
  }) : super();

  update() {
    emit(state.setLoading());
    refresh();
  }

  refresh() {
    final list = _get(recipeId);
    emit(state.setFull(list));
  }

  createComment(String text) {
    emit(state.setOperationLoading());
    _create.call(
        recipeId: recipeId,
        text: text,
        onCreate: (created) {
          emit(state.setFull([...state.data ?? [], created]));
        });
  }
}
