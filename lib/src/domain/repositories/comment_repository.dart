import 'package:ik8_otus_food/src/domain/entities/comment.dart';


abstract class CommentRepository {
  List<RecipeComment> byRecipe(dynamic id);

  void createComment(
      {required dynamic recipeId,
        required String text,
        required Function(RecipeComment created) onCreate});
}
