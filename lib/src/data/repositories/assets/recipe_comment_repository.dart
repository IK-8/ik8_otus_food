import 'package:ik8_otus_food/src/data/datasources/assets/comments.dart';
import 'package:ik8_otus_food/src/domain/repositories/comment_repository.dart';

import '../../../domain/entities/comment.dart';

class CommentRepositoryImpl extends CommentRepository {
  final AssetRecipeCommentsService _service;

  CommentRepositoryImpl(this._service);

  @override
  List<RecipeComment> byRecipe(dynamic id) {
    return _service.byRecipe(id);
  }

  @override
  void createComment(
      {required dynamic recipeId,
      required String text,
      required Function(RecipeComment created) onCreate}) {
    _service.create(recipeId: recipeId, text: text,onCreate: onCreate);
  }
}
