import 'dart:io';

import 'package:flutter/material.dart';

import 'package:ik8_otus_food/src/core/bloc/bloc.dart';

import '../../../blocs/recipe_gallery/create_recipe_shot.dart';
import '../../../blocs/recipe_gallery/gallery_by_recipe.dart';
import '../../../widgets/gallery/gallery.dart';

class CreateRecipeShotPage extends StatelessWidget {
  const CreateRecipeShotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CreateRecipeShotCubit>().state;
    final data = state.data;
    final image = data?.image;
    final detection = data?.detection;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (image != null)
            Expanded(
              child: Stack(
                // fit: StackFit.loose,
                children: [
                  CustomPaint(
                    foregroundPainter: DetectionPainter(detection),
                    child: Image.file(File(image.path)),
                  ),
                  if (detection == null)
                    Positioned.fill(
                      child: Container(
                        color: Colors.black54,
                        child: const Center(
                          child: Text(
                            'Поис объектов...',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          // Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () async {
                if (image != null) {
                  context.read<GalleryListByRecipeCubit>().save(
                      data: await image.readAsBytes(),
                      detected: detection ?? []);
                  Navigator.pop(context);
                }
              },
              child: const Text('Сохранить'),
            ),
          )
        ],
      ),
    );
  }
}
