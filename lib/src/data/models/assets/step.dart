import '../../../domain/entities/step.dart';

class AssetRecipeStep extends RecipeStep {
  const AssetRecipeStep(
      {required super.id,
      required super.recipeId,
      required super.title,
      required super.seconds,
      super.isChecked});

  @override
  AssetRecipeStep copyWith({bool? isChecked}) {
    return AssetRecipeStep(
        id: id,
        recipeId: recipeId,
        title: title,
        seconds: seconds,
        isChecked: isChecked ?? this.isChecked);
  }
}
