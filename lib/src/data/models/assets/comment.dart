import '../../../domain/entities/comment.dart';

class AssetRecipeComment extends RecipeComment {
  const AssetRecipeComment(
      {required super.id,
      required super.recipeId,
      required super.text,
      required super.time});
}
