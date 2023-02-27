import 'package:ik8_otus_food/src/domain/entities/comment.dart';

import '../../repositories/comment_repository.dart';

class CreateRecipeCommentUseCase {
  final CommentRepository _repository;

  CreateRecipeCommentUseCase(this._repository);

  call(
      {required dynamic recipeId,
      required String text,
      required Function(RecipeComment created) onCreate}) {
    _repository.createComment(
        recipeId: recipeId, text: text, onCreate: onCreate);
  }
}
