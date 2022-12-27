import 'package:ik8_otus_food/src/core/extension/extension.dart';

import 'product.dart';

abstract class RecipeIngredient {
  final double count;
  final RecipeProduct product;

  const RecipeIngredient({this.count = 0, required this.product});

  String get measureTitle {
    if(count == 0){
      return 'по вкусу';
    }
    String countFormat = count.fractionFormat;

    if (product.measure.title != null) {
      return '$countFormat ${product.measure.title}';
    } else if (product.measure.type == null) {
      return 'по вкусу';
    }
    return '$countFormat ${product.measure.type}';
  }
}
