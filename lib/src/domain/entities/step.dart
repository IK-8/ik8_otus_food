abstract class RecipeStep {
  final int id;
  final int recipeId;
  final String title;
  final int seconds;
  final bool isChecked;

  const RecipeStep(
      {required this.id,
      required this.recipeId,
      required this.title,
      required this.seconds,
      this.isChecked = false});

  RecipeStep copyWith({bool? isChecked});
}
