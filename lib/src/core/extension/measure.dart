import 'package:ik8_otus_food/src/domain/entities/ingredient.dart';
import 'package:ik8_otus_food/src/domain/entities/measure.dart';
import 'double.dart';
import '../../../l10n/extension.dart';

extension MeasureLocalizationEx on AppLocalizations {
  String ingredientMeasureFormat(RecipeIngredient ingredient) {
    if (ingredient.count == 0) {
      return toTaste;
    }
    String countFormat = ingredient.count.fractionFormat;

    if (ingredient.product.measure.title != null) {
      return '$countFormat ${ingredient.product.measure.title}';
    } else if (ingredient.product.measure.type == null) {
      return toTaste;
    }
    final measureType = ingredient.product.measure.type!;
    return '${measureType == Measure.wt ? '' : '$countFormat '}${measureFormat(ingredient.count, measureType)}';
  }

  String measureFormat(double count, Measure measure) {
    count = count ;
    switch (measure) {
      case Measure.wt:
        var kgCount = count.floor();
        var gCount = count - kgCount;
        return '${kgCount == 0 ? '' : '$kgCount $kg'}'
            '${kgCount != 0 && gCount != 0 ? ' ' : ''}'
            '${gCount == 0 ? '' : '${(gCount * 1000).floor()} $g'}';
      case Measure.pcs:
        return pcs;
      case Measure.tsp:
        return count.isFractional
            ? few_tsp
            : Intl.plural(count.floor(),
                locale: localeName,
                other: few_tbs,
                many: many_tsp,
                one: one_tsp,
                few: few_tsp);
      case Measure.tbs:
        return count.isFractional
            ? few_tbs
            : Intl.plural(count.floor(),
                locale: localeName,
                other: few_tbs,
                many: many_tsp,
                one: one_tbs,
                few: few_tbs);
      case Measure.clove:
        return count.isFractional
            ? few_clove
            : Intl.plural(count.floor(),
            locale: localeName,
                other: few_clove,
                one: one_clove,
                many: many_clove,
                few: few_clove);
    }
  }
}
