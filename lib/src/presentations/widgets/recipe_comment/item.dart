import 'package:flutter/material.dart';
import 'package:ik8_otus_food/src/domain/entities/comment.dart';

import '../../../../l10n/extension.dart';
import '../../../config/theme/main.dart';

class RecipeCommentItem extends StatelessWidget {
  final RecipeComment item;

  const RecipeCommentItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.ddMMyyFormat(item.time),
          style: const TextStyle(
              color: hintColor,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 12),
        Text(
          item.text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
