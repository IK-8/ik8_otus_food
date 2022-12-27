import '../../../domain/entities/step.dart';

class AssetRecipeStep extends RecipeStep {
  const AssetRecipeStep(
      {required super.id,
      required super.title,
      required super.seconds,
      super.isChecked});
}
