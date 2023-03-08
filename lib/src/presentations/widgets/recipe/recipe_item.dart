import 'package:flutter/material.dart';
import '../../../domain/entities/recipe.dart';
import '../image/food_error_builder.dart';
import 'duration_view.dart';

class RecipeItem extends StatelessWidget {
  final Recipe item;

  const RecipeItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A959292),
            offset: Offset(0, 4),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      // elevation: 2.5,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 4,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4)),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    item.image,
                    fit: BoxFit.cover,
                    errorBuilder: foodErrorBuilder,
                  ),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 22)),
                    const SizedBox(height: 10),
                    DurationView(item.seconds)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
