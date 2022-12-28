import 'package:flutter/material.dart';

import '../../../../core/extension/focus.dart';

class CommentField extends StatelessWidget {
  // final FocusNode focus;
  final TextEditingController controller;
  final Function(String text) create;

  const CommentField(
      {Key? key,
      // required this.focus,
      required this.controller,
      required this.create})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff165932),
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
              // focusNode: focus,
              decoration: const InputDecoration(
                  hintText: 'оставить комментарий',
                  helperStyle: TextStyle(color: Color(0xffC2C2C2)),
                  border: InputBorder.none),
              maxLines: 3,
              controller: controller,
            ),
          ),
          IconButton(
            onPressed: () {
              final text = controller.text.trim();
              if (text.isNotEmpty) {
                create(text);
                clearCurrentFocus(context);
                controller.clear();
              }
            },
            icon: const Icon(Icons.near_me_rounded),
          )
        ],
      ),
    );
  }
}
