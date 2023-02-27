import 'recipe.dart';
import 'step.dart';

class RecipeInfo {
  final Recipe recipe;
  final List<RecipeStep> steps;

  const RecipeInfo({
    required this.recipe,
    this.steps = const [],
  });

  int get id => recipe.id;

  RecipeInfo copyWith({Recipe? recipe, List<RecipeStep>? steps}) {
    return RecipeInfo(
      recipe: recipe ?? this.recipe,
      steps: steps ?? this.steps,
    );
  }
}
