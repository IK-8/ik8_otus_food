import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ik8_otus_food/src/config/theme/main.dart';
import 'package:ik8_otus_food/src/core/bloc/bloc.dart';
import 'package:ik8_otus_food/src/data/models/local/gallery_image.dart';

import '../../../../data/models/local/detected_object.dart';
import '../../../blocs/recipe_gallery/create_recipe_shot.dart';
import '../../../blocs/recipe_gallery/gallery_by_recipe.dart';

class RecipeGalleryFragment extends StatelessWidget {
  const RecipeGalleryFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listState = context.watch<GalleryListByRecipeCubit>().state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (listState.isLoading)
          const SizedBox(
            height: 150,
            child: Center(child: CircularProgressIndicator()),
          ),
        if (!listState.isLoading && listState.list.isNotEmpty)
          SizedBox(
            height: 150,
            child: (ListView.builder(
              itemBuilder: (context, index) {
                var item = listState.list[index];
                return Padding(
                  padding: const EdgeInsets.all(2),
                  child: Image.memory(item.data),
                );
              },
              itemCount: listState.list.length,
              scrollDirection: Axis.horizontal,
            )),
          ),
        ElevatedButton.icon(
          onPressed: () {
            context.read<CreateRecipeShotCubit>().createShot().then((value) {
              if (value?.image != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MultiBlocProvider(
                      providers: [
                        BlocProvider.value(
                            value: context.read<CreateRecipeShotCubit>()),
                        BlocProvider.value(
                            value: context.read<GalleryListByRecipeCubit>()),
                      ],
                      child: const CreateRecipeShotPage(),
                    ),
                  ),
                );
              }
            });
          },
          label: const Text(
            'Добавить изображение',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          icon: const Icon(
            Icons.camera_alt_rounded,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

class ImageGalleryPanel {
  final Set<String> detectionHide;
  final List<GalleryImage> list;
  final int currentIndex;

  GalleryImage get current => list[currentIndex];

  const ImageGalleryPanel({
    this.currentIndex = 0,
    this.detectionHide = const {},
    required this.list,
  });

  ImageGalleryPanel hide(String name) {
    return copyWith(
      detectionHide: {...detectionHide, name},
    );
  }

  ImageGalleryPanel unhide(String name) {
    return copyWith(
      detectionHide: {...detectionHide}..remove(name),
    );
  }

  ImageGalleryPanel setCurrent(int index) {
    return copyWith(currentIndex: index);
  }

  ImageGalleryPanel copyWith({
    Set<String>? detectionHide,
    int? currentIndex,
  }) {
    return ImageGalleryPanel(
      list: list,
      currentIndex: currentIndex ?? this.currentIndex,
      detectionHide: detectionHide ?? this.detectionHide,
    );
  }

  bool isHide(DetectedObject obj) {
    return detectionHide.contains(obj.name);
  }
}

class ImageGalleryViewerCubit extends Cubit<ImageGalleryPanel> {
  ImageGalleryViewerCubit(
    List<GalleryImage> list, {
    int currentIndex = 0,
  }) : super(
          ImageGalleryPanel(
            currentIndex: currentIndex,
            list: list,
          ),
        );

  void attach(PageController controller) {
    controller.addListener(() {

    });
  }
}

class ImageGalleryListPage extends StatelessWidget {
  final List<GalleryImage> image;

  const ImageGalleryListPage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

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

class DetectionPainter extends CustomPainter {
  final List<DetectedObject>? detection;

  DetectionPainter(this.detection);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = primaryColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    for (DetectedObject item in detection ?? []) {
      canvas.drawRect(
          Offset(item.x * size.width, item.y * size.height) &
              Size(item.width * size.width, item.height * size.height),
          paint);
      TextSpan span = TextSpan(
        style:
            const TextStyle(color: Colors.white, backgroundColor: primaryColor),
        text: item.name,
      );
      TextPainter tp = TextPainter(
          text: span,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr);
      tp.layout();
      tp.paint(canvas, Offset(item.x * size.width, item.y * size.height));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
