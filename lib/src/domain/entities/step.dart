abstract class RecipeStep {
  final int id;
  final String title;
  final int seconds;
  final bool isChecked;

  const RecipeStep(
      {required this.id,
      required this.title,
      required this.seconds,
      this.isChecked = false});
}
