import 'package:ik8_otus_food/src/domain/entities/ingredient.dart';

abstract class RecipeData extends Recipe {
  @override
  final dynamic id;
  @override
  final String image;
  @override
  final String title;
  @override
  final int seconds;
  @override
  final bool isFavorite;
  @override
  final bool isStarted;
  @override
  final List<RecipeIngredient> ingredients;

  const RecipeData(
      {required this.id,
      required this.image,
      required this.title,
      required this.seconds,
      required this.ingredients,
      this.isStarted = false,
      this.isFavorite = false});

  @override
  Recipe copyWith({bool? isFavorite, bool? isStarted});
}

abstract class Recipe {
  dynamic get id;

  String get image;

  String get title;

  int get seconds;

  bool get isFavorite;

  bool get isStarted;

  List<RecipeIngredient> get ingredients;

  const Recipe();

  Recipe copyWith({bool? isFavorite, bool? isStarted});
}
