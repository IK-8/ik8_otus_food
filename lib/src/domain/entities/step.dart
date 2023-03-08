abstract class RecipeStepData extends RecipeStep {
  @override
  final dynamic id;
  @override
  final dynamic recipeId;
  @override
  final String title;
  @override
  final int seconds;
  @override
  final bool isChecked;

  const RecipeStepData({
    required this.id,
    required this.recipeId,
    required this.title,
    required this.seconds,
    this.isChecked = false,
  });
}

abstract class RecipeStep {
  dynamic get id;

  dynamic get recipeId;

  String get title;

  int get seconds;

  bool get isChecked;

  const RecipeStep();

  RecipeStep copyWith({bool? isChecked});
}
