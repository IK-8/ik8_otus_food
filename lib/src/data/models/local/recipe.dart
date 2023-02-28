import 'package:hive/hive.dart';

import '../../../domain/entities/ingredient.dart';
import '../../../domain/entities/recipe.dart';
import 'ingredient.dart';

part 'recipe.g.dart';

@HiveType(typeId: 1)
class LocalRecipe extends Recipe with HiveObjectMixin {
  @HiveField(0)
  @override
  final dynamic id;
  @HiveField(1)
  @override
  final String image;
  @HiveField(2)
  @override
  final String title;
  @HiveField(3)
  @override
  final int seconds;
  @HiveField(4)
  @override
  final bool isFavorite;
  @HiveField(5)
  @override
  final bool isStarted;
  @HiveField(6)
  @override
  final List<LocalRecipeIngredient> ingredients;

  LocalRecipe({
    required this.id,
    required this.image,
    required this.title,
    required this.seconds,
    this.ingredients = const [],
    this.isStarted = false,
    this.isFavorite = false,
  });

  @override
  LocalRecipe copyWith({bool? isFavorite, bool? isStarted}) {
    return LocalRecipe(
      id: id,
      image: image,
      title: title,
      seconds: seconds,
      isFavorite: isFavorite ?? this.isFavorite,
      isStarted: isStarted ?? this.isStarted,
      ingredients: ingredients,
    );
  }
}
