import 'package:flutter/material.dart';

import 'package:ik8_otus_food/src/core/bloc/bloc.dart';
import '../../../../data/models/local/gallery_image.dart';
import '../../../blocs/recipe_gallery/image_gallery_viewer.dart';
import '../../../widgets/gallery/gallery.dart';

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
                      return const SizedBox();
                    }
                    final current = state.current;
                    final detected =
                        current.detected.map((e) => e.name).toSet().toList();
                    return Column(
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
