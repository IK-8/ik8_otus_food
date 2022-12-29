import 'package:ik8_otus_food/src/domain/entities/comment.dart';


abstract class CommentRepository {
  List<RecipeComment> byRecipe(int id);

  void createComment(
      {required int recipeId,
        required String text,
        required Function(RecipeComment created) onCreate});
}
