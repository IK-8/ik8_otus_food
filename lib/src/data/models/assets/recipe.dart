import 'package:ik8_otus_food/src/domain/entities/recipe.dart';

class AssetRecipe extends Recipe {
  const AssetRecipe(
      {required super.image,
      required super.title,
      required super.id,
      required super.seconds,
      super.ingredients = const [],
      super.isFavorite,
      super.isStarted,
      super.comments = const []});

  @override
  AssetRecipe copyWith({bool? isFavorite, bool? isStarted}) {
    return AssetRecipe(
      image: image,
      title: title,
      id: id,
      seconds: seconds,
      ingredients: ingredients,
      isFavorite: isFavorite ?? this.isFavorite,
      isStarted: isStarted ?? this.isStarted,
      comments: comments,
    );
  }
}
