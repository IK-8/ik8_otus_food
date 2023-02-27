import 'package:ik8_otus_food/src/domain/entities/ingredient.dart';


abstract class Recipe {
  final int id;
  final String image;
  final String title;
  final int seconds;
  final bool isFavorite;
  final bool isStarted;
  final List<RecipeIngredient> ingredients;

  const Recipe(
      {required this.id,
      required this.image,
      required this.title,
      required this.seconds,
      required this.ingredients,
      this.isStarted = false,
      this.isFavorite = false});

  Recipe copyWith({bool? isFavorite, bool? isStarted});
}
