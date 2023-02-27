import 'package:ik8_otus_food/src/domain/entities/comment.dart';
import 'package:ik8_otus_food/src/domain/repositories/comment_repository.dart';

class GetAllCommentsByRecipeUseCase {
  final CommentRepository _repository;

  GetAllCommentsByRecipeUseCase(this._repository);

  List<RecipeComment> call(dynamic recipeId) {
    return _repository.byRecipe(recipeId);
  }
}
