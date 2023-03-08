import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/local/detected_object.dart';
import '../../../data/models/local/gallery_image.dart';

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
