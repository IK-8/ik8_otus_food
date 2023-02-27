import 'package:flutter/material.dart';
import 'package:ik8_otus_food/src/config/theme/main.dart';

Widget foodErrorBuilder(
  BuildContext context,
  Object error,
  StackTrace? stackTrace,
) =>
    const FoodPlaceHolder();

class FoodPlaceHolder extends StatelessWidget {
  const FoodPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.bakery_dining_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
