import 'package:flutter/material.dart';
import 'package:ik8_otus_food/src/core/extension/extension.dart';

import '../../../config/theme/main.dart';
import '../../../domain/entities/step.dart';
import '../check_box.dart';

class RecipeStepItem extends StatelessWidget {
  final int index;
  final RecipeStep item;
  final bool enabled;
  final ValueChanged<bool> onSelect;

  const RecipeStepItem(
      {Key? key,
      required this.index,
      required this.item,
      this.enabled = false,
      required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color cardColor =
        enabled ? const Color(0x262ecc71) : backgroundColor;
    Color textColor =
        enabled ? const Color(0xff2D490C) : greyColor;
    Color stepColor =
        enabled ? primaryColor : hintColor;
    Color durationColor =
        enabled ? primaryDarkColor : greyColor;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: cardColor),
      padding: const EdgeInsets.symmetric(vertical: 16),
      margin: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Flexible(
              fit: FlexFit.tight,
              child: Center(
                child: Text(
                  index.toString(),
                  style: TextStyle(
                      color: stepColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w900),
                ),
              )),
          Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Text(
                item.title,
                style: TextStyle(color: textColor),
                textAlign: TextAlign.start,
              )),
          Flexible(
              fit: FlexFit.tight,
              child: Column(
                children: [
                  AppCheckbox(
                    onChange: enabled ? onSelect : null,
                    isChecked: item.isChecked,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    item.seconds.mmssDurationFormatFromSeconds,
                    style: TextStyle(
                      color: durationColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
