import 'recipe.dart';
import 'step.dart';
import 'comment.dart';

class RecipeInfo {
  final Recipe recipe;
  final List<RecipeStep> steps;
  final List<RecipeComment> comments;

  const RecipeInfo(
      {required this.recipe, required this.steps, required this.comments});

  int get id => recipe.id;
}
