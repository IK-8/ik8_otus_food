import 'measure.dart';

abstract class RecipeProduct {
  final IngredientMeasure measure;
  final String name;

  RecipeProduct({required this.measure, required this.name});
}
