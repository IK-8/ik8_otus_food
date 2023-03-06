import 'dart:io';
import 'package:flutter/cupertino.dart';
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
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ImageGalleryListPage(
                          image: listState.list,
                          currentIndex: index,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Image.memory(item.data),
                  ),
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
  final bool isHide;

  GalleryImage get current => list[currentIndex];

  const ImageGalleryPanel({
    this.currentIndex = 0,
    this.detectionHide = const {},
    required this.list,
    this.isHide = false,
  });

  ImageGalleryPanel hideDetection(String name) {
    return copyWith(
      detectionHide: {...detectionHide, name},
    );
  }

  ImageGalleryPanel unhideDetection(String name) {
    return copyWith(
      detectionHide: {...detectionHide}..remove(name),
    );
  }

  ImageGalleryPanel setCurrent(int index) {
    return copyWith(currentIndex: index);
  }

  ImageGalleryPanel setHide(bool isHide) {
    return copyWith(isHide: isHide);
  }

  ImageGalleryPanel copyWith({
    Set<String>? detectionHide,
    int? currentIndex,
    bool? isHide,
  }) {
    return ImageGalleryPanel(
      list: list,
      currentIndex: currentIndex ?? this.currentIndex,
      detectionHide: detectionHide ?? this.detectionHide,
      isHide: isHide ?? this.isHide,
    );
  }

  bool detectionIsHide(DetectedObject obj) {
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
      final page = (controller.page ?? 0).round();
      if (state.currentIndex != page) {
        emit(state.setCurrent(page));
      }
    });
  }

  void hide(bool isHide) {
    emit(state.setHide(isHide));
  }

  void switchHide() {
    emit(state.setHide(!state.isHide));
  }

  void hideDetected(String name, bool isHide) {
    if (isHide) {
      emit(state.hideDetection(name));
    } else {
      emit(state.unhideDetection(name));
    }
  }
}

class ImageGalleryListPage extends StatelessWidget {
  final int currentIndex;
  final List<GalleryImage> image;

  const ImageGalleryListPage({
    Key? key,
    required this.image,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ImageGalleryViewerCubit(
        image,
        currentIndex: currentIndex,
      ),
      child: const ImageGalleryListView(),
    );
  }
}

class ImageGalleryListView extends StatefulWidget {
  const ImageGalleryListView({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageGalleryListView> createState() => _ImageGalleryListViewState();
}

class _ImageGalleryListViewState extends State<ImageGalleryListView> {
  late final _controller = PageController(
    initialPage: context.read<ImageGalleryViewerCubit>().state.currentIndex,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final viewer = context.read<ImageGalleryViewerCubit>();
    viewer.attach(_controller);
  }

  @override
  Widget build(BuildContext context) {
    final list =
        context.select((ImageGalleryViewerCubit value) => value.state.list);
    final detection = context
        .select((ImageGalleryViewerCubit value) => value.state.detectionHide);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            context.read<ImageGalleryViewerCubit>().switchHide();
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: PageView.builder(
                  controller: _controller,
                  itemBuilder: (context, index) {
                    final item = list[index];
                    return InteractiveViewer(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomPaint(
                              foregroundPainter: DetectionPainter(item.detected,
                                  hidden: detection),
                              child: Image.memory(item.data)),
                        ],
                      ),
                    );
                  },
                  itemCount: list.length,
                ),
              ),
              Positioned.fill(
                child: BlocBuilder<ImageGalleryViewerCubit, ImageGalleryPanel>(
                  builder: (context, state) {
                    if (state.isHide) {
                      return SizedBox();
                    }
                    final current = state.current;
                    final detected =
                        current.detected.map((e) => e.name).toSet().toList();
                    return Container(
                      child: GestureDetector(
                        onTap: () {
                          // context.read<ImageGalleryViewerCubit>().hide(true);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              color: Colors.black38,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '${state.currentIndex + 1}/${list.length}',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.black45,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  if (current.detected.isNotEmpty)
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: [
                                        for (var item in detected)
                                          Chip(
                                            label: Text(item),
                                            onDeleted: () {
                                              context
                                                  .read<
                                                      ImageGalleryViewerCubit>()
                                                  .hideDetected(
                                                      item,
                                                      !detection
                                                          .contains(item));
                                            },
                                            deleteIcon: detection.contains(item)
                                                ? const Icon(
                                                    Icons.visibility_off)
                                                : const Icon(Icons.visibility),
                                          )
                                      ],
                                    )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
  final Set<String> hidden;

  DetectionPainter(this.detection, {this.hidden = const {}});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = primaryColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    for (DetectedObject item in detection ?? []) {
      if (hidden.contains(item.name)) {
        continue;
      }
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
