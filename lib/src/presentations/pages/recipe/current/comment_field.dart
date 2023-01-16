import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ik8_otus_food/l10n/extension.dart';

import '../../../../config/shortcuts/shortcuts.dart';
import '../../../../config/theme/main.dart';
import '../../../../core/extension/focus.dart';

class CommentField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String text) create;
  final FocusNode focusNode;

  const CommentField({
    Key? key,
    required this.controller,
    required this.create,
    required this.focusNode,
  }) : super(key: key);

  onCreate(BuildContext context) {
    final text = controller.text.trim();
    if (text.isNotEmpty) {
      create(text);
      clearCurrentFocus(context);
      controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: {
        enterMessageShortcut: () => onCreate(context),
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: primaryDarkColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: TextFormField(
                focusNode: focusNode,
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.leaveCommentHint,
                    helperStyle: const TextStyle(color: hintColor),
                    border: InputBorder.none),
                maxLines: 3,
                controller: controller,
              ),
            ),
            IconButton(
              tooltip:
                  kIsWeb ? AppLocalizations.of(context)!.commandForEnter : null,
              onPressed: () => onCreate(context),
              icon: const Icon(Icons.near_me_rounded),
            )
          ],
        ),
      ),
    );
  }
}
