import 'package:hive/hive.dart';
part 'measure.g.dart';
@HiveType(typeId: 133)
enum Measure {
  @HiveField(0)

  /// килограмм
  wt,

  @HiveField(1)

  /// штук
  pcs,

  @HiveField(2)

  /// чайная ложка
  tsp,

  @HiveField(3)

  /// столовая ложка
  tbs,

  @HiveField(4)

  /// долька
  clove,

  @HiveField(5)

  /// стаканы
  cup
}

class IngredientMeasure {
  final Measure? type;
  final String? title;

  const IngredientMeasure(this.type) : title = null;

  const IngredientMeasure.custom(String this.title) : type = null;

  const IngredientMeasure.data(this.type, this.title);

  static const empty = IngredientMeasure(null);
}
