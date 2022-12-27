enum Measure {
  /// килограмм
  wt,

  /// штук
  pcs,

  /// чайная ложка
  tsp,

  /// столовая ложка
  tbs,

  /// долька
  clove
}

class IngredientMeasure {
  final Measure? type;
  final String? title;

  const IngredientMeasure(this.type) : title = null;

  const IngredientMeasure.custom(String this.title) : type = null;
}
