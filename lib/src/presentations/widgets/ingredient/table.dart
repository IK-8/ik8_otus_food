import 'package:flutter/material.dart';
import 'package:ik8_otus_food/l10n/extension.dart';
import 'package:ik8_otus_food/src/core/extension/extension.dart';
import 'package:ik8_otus_food/src/domain/entities/ingredient.dart';

const bullet = "\u2022 ";

class IngredientTable extends StatelessWidget {
  final List<RecipeIngredient> list;

  const IngredientTable({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color(0xff797676), width: 3),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(),
            1: IntrinsicColumnWidth(),
          },
          children: [
            for (var item in list)
              TableRow(children: [
                Text(
                  "$bullet${item.product.name}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      height: 1.8),
                ),
                Text(
                  AppLocalizations.of(context)!.ingredientMeasureFormat(item),
                  style: const TextStyle(
                      color: Color(0xff797676),
                      fontWeight: FontWeight.w400,
                      height: 1.8),
                ),
              ])
          ],
        ));
  }
}
