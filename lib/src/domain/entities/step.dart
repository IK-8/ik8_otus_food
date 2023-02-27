abstract class RecipeStep {
  final dynamic id;
  final dynamic recipeId;
  final String title;
  final dynamic seconds;
  final bool isChecked;

  const RecipeStep(
      {required this.id,
      required this.recipeId,
      required this.title,
      required this.seconds,
      this.isChecked = false});

  RecipeStep copyWith({bool? isChecked});
}
