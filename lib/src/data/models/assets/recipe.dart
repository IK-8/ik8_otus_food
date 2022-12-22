import 'package:ik8_otus_food/src/domain/entities/recipe.dart';

class AssetRecipe extends Recipe {
  const AssetRecipe(
      {required super.image,
      required super.title,
      required super.seconds,
      super.steps= const [],
      super.isFavorite,
      super.isStarted,
      super.comments = const []});
}
