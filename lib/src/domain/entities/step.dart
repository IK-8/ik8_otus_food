abstract class RecipeStep {
  final String title;
  final int seconds;
  final bool isChecked;

  const RecipeStep(
      { required this.title,
        required this.seconds,
        this.isChecked = false});
}
