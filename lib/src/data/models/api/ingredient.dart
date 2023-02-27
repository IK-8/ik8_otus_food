import 'package:ik8_otus_food/src/domain/entities/ingredient.dart';
import 'package:ik8_otus_food/src/domain/entities/measure.dart';

import 'product.dart';

class IngredientModel extends RecipeIngredient {
  IngredientModel({required super.product, super.count});

  static List<IngredientModel> fromRecipe(Map<String, dynamic> json) {
    List<IngredientModel> list = [];
    for (int i = 1; i <= 20; i++) {
      final name = json['strIngredient$i'] as String?;
      if (name == null || name.isEmpty) {
        break;
      }
      final measureValues = (json['strMeasure$i'] as String? ?? '').split(' ')
        ..removeWhere((element) => element.trim().isEmpty);
      if (measureValues.isEmpty) {
        list.add(
          IngredientModel(
            product: ProductModel(
              name: name,
              measure: const IngredientMeasure(Measure.wt),
            ),
          ),
        );
      } else {
        if (measureValues.length == 1) {
          list.add(
            IngredientModel(
              product: ProductModel(
                name: name,
                measure: IngredientMeasure.custom(measureValues.first),
              ),
            ),
          );
        } else if (measureValues.length >= 2) {
          final count = decimalTryParse(measureValues.first) ?? 0;
          final productMeasure = (StringBuffer()
                ..writeAll([...measureValues]..removeAt(0), ' '))
              .toString();
          final measureType = parsedMeasureValues[productMeasure];
          list.add(
            IngredientModel(
              count: count,
              product: ProductModel(
                name: name,
                measure: measureType == null
                    ? IngredientMeasure.custom(productMeasure)
                    : IngredientMeasure(measureType),
              ),
            ),
          );
        }
      }
    }
    return list;
  }
}

double? decimalTryParse(String value) {
  if (value.contains('/')) {
    final values = value.split('/');
    if (values.length == 2) {
      return (int.tryParse(values.first) ?? 0) /
          (int.tryParse(values.last) ?? 1);
    }
    return null;
  }
  return double.tryParse(value);
}

Map<String, Measure> parsedMeasureValues = {
  'tsp': Measure.tsp,
  'tbs': Measure.tbs,
};
