import 'dart:math';

import 'package:ik8_otus_food/src/data/models/api/ingredient.dart';
import 'package:ik8_otus_food/src/domain/entities/recipe.dart';

class RecipeModel extends RecipeData {
  RecipeModel({
    required super.id,
    required super.image,
    required super.title,
    required super.seconds,
    super.ingredients = const [],
    super.isFavorite,
    super.isStarted,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['idMeal'],
      image: json['strMealThumb'],
      title: json['strMeal'],
      ingredients: IngredientModel.fromRecipe(json),
      seconds: Random().nextInt(60) * 60,
    );
  }

  @override
  Recipe copyWith({bool? isFavorite, bool? isStarted}) {
    return RecipeModel(
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
