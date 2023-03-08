abstract class RecipeComment {
  final dynamic id;
  final dynamic recipeId;
  final String text;
  final DateTime time;

  const RecipeComment(
      {required this.id,
      required this.recipeId,
      required this.text,
      required this.time});
}
