import 'package:flutter/material.dart';
import 'package:ik8_otus_food/src/config/theme/main.dart';

class AppCheckbox extends StatelessWidget {
  final ValueChanged<bool>? onChange;
  final bool isChecked;

  const AppCheckbox({Key? key, this.isChecked = false, required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: isChecked,
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return greyColor;
            }
            return primaryDarkColor;
          }),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(3.5)),
          ),
          onChanged: onChange == null
              ? null
              : (value) => onChange?.call(value ?? false)),
    );
  }
}
