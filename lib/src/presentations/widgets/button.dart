import 'package:flutter/material.dart';

import '../../config/theme/main.dart';

class ToggleOutlineFilledButton extends StatelessWidget {
  final bool outlined;
  final String outlinedLabel;
  final String filledLabel;

  /// Вызывается, передавая значение - bool outlined
  final ValueChanged<bool> onPressed;

  const ToggleOutlineFilledButton(
      {Key? key,
      this.outlined = true,
      required this.outlinedLabel,
      required this.filledLabel,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final label = outlined ? outlinedLabel : filledLabel ?? outlinedLabel;
    const outlinedLabelStyle = TextStyle(color: primaryDarkColor, fontSize: 16);
    const filledLabelStyle = TextStyle(color: Colors.white, fontSize: 16);
    return OutlinedButton(
      onPressed: () {
        onPressed(!outlined);
      },
      style: OutlinedButton.styleFrom(
        side: const BorderSide(width: 4.0, color: primaryDarkColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        backgroundColor: outlined ? null : primaryDarkColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        child: IndexedStack(
          index: outlined ? 0 : 1,
          alignment: Alignment.center,
          children: [
            Text(
              outlinedLabel,
              style: outlinedLabelStyle,
            ),
            Text(
              filledLabel,
              style: filledLabelStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends StatelessWidget {
  final ValueChanged<bool> onChanged;
  final bool value;

  const FavoriteButton({Key? key, required this.onChanged, this.value = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onChanged(!value);
      },
      splashColor: value ?  null : const Color(0x66e74c3c),
      padding: EdgeInsets.zero,
      iconSize: 30,
      icon: value
          ? const Icon(
              Icons.favorite,
              color: Color(0xffE74C3C),
            )
          : const Icon(
              Icons.favorite,
              color: Color(0xff3B3B3B),
            ),
    );
  }
}
