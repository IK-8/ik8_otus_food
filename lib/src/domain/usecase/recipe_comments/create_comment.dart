import 'package:ik8_otus_food/src/domain/entities/comment.dart';

import '../../entities/recipe.dart';
import '../../entities/recipe_info.dart';
import '../../repositories/comment_repository.dart';
import '../../repositories/recipe_repository.dart';

class CreateRecipeCommentUseCase {
  final CommentRepository _repository;

  CreateRecipeCommentUseCase(this._repository);

  call(
      {required int recipeId,
      required String text,
      required Function(RecipeComment created) onCreate}) {
    _repository.createComment(
        recipeId: recipeId, text: text, onCreate: onCreate);
  }
}
