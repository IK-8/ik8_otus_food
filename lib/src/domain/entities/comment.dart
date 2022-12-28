abstract class RecipeComment {
  final int id;
  final int recipeId;
  final String text;
  final DateTime time;

  const RecipeComment(
      {required this.id,
      required this.recipeId,
      required this.text,
      required this.time});
}
