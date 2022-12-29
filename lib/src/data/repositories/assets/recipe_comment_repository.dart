import 'package:ik8_otus_food/src/data/datasources/assets/comments.dart';
import 'package:ik8_otus_food/src/domain/entities/recipe.dart';
import 'package:ik8_otus_food/src/domain/repositories/comment_repository.dart';

import '../../../domain/entities/comment.dart';
import '../../../domain/entities/recipe_info.dart';
import '../../../domain/repositories/recipe_repository.dart';
import '../../datasources/assets/recipe.dart';

class CommentRepositoryImpl extends CommentRepository {
  final AssetRecipeCommentsService _service;

  CommentRepositoryImpl(this._service);

  @override
  List<RecipeComment> byRecipe(int id) {
    return _service.byRecipe(id);
  }

  @override
  void createComment(
      {required int recipeId,
      required String text,
      required Function(RecipeComment created) onCreate}) {
    _service.create(recipeId: recipeId, text: text,onCreate: onCreate);
  }
}
