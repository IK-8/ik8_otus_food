import 'package:ik8_otus_food/src/domain/entities/comment.dart';

import 'step.dart';

abstract class Recipe {
  final String image;
  final String title;
  final int seconds;
  final bool isFavorite;
  final bool isStarted;
  final List<RecipeStep> steps;
  final List<RecipeComment> comments;

  const Recipe(
      {required this.image,
      required this.title,
      required this.seconds,
      required this.steps,
      required this.comments,
      this.isStarted = false,
      this.isFavorite = false});
}
