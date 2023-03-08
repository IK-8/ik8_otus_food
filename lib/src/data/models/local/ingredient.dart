import 'package:hive/hive.dart';
import 'package:ik8_otus_food/src/domain/entities/product.dart';

import '../../../domain/entities/ingredient.dart';
import '../../../domain/entities/measure.dart';

part 'ingredient.g.dart';

@HiveType(typeId: 132)
class LocalRecipeIngredient extends RecipeIngredient with HiveObjectMixin {
  @HiveField(0)
  @override
  double count;

  @override
  RecipeProduct get product => RecipeProduct(
      name: productName,
      measure: IngredientMeasure.data(productMeasureType, productMeasureTitle));

  @HiveField(1)
  String productName;
  @HiveField(2)
  Measure? productMeasureType;
  @HiveField(3)
  String? productMeasureTitle;

  LocalRecipeIngredient(
      {required this.count,
      required this.productName,
      required this.productMeasureType,
      required this.productMeasureTitle});

  factory LocalRecipeIngredient.byData(RecipeIngredient data) {
    return LocalRecipeIngredient(
      count: data.count,
      productName: data.product.name,
      productMeasureType: data.product.measure.type,
      productMeasureTitle: data.product.measure.title,
    );
  }
}
