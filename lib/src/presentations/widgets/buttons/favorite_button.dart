import 'package:flutter/material.dart';

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