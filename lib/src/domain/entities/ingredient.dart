
import 'product.dart';

abstract class RecipeIngredient {
  final double count;
  final RecipeProduct product;

  const RecipeIngredient({this.count = 0, required this.product});
}
