import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ik8_otus_food/src/config/theme/main.dart';

import '../../../blocs/recipe_gallery/create_recipe_shot.dart';

class RecipeGalleryFragment extends StatelessWidget {
  const RecipeGalleryFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            context.read<CreateRecipeShotCubit>().createShot().then((value) {
              if (value?.image != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: context.read<CreateRecipeShotCubit>(),
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
                  // Positioned.fill(
                  //   child: LayoutBuilder(builder: (context, size) {
                  //     return Image.file(
                  //       File(image.path),
                  //       frameBuilder:
                  //           (context, child, frame, wasSynchronouslyLoaded) {
                  //         final image = (child as Semantics).child as RawImage;
                  //         final width = image.image?.width;
                  //         final height = image.image?.height;
                  //         final w = width == null ? size.maxWidth : size.maxWidth;
                  //         final h = height == null ? size.maxHeight : size.maxHeight;
                  //         return Stack(
                  //           fit: StackFit.expand,
                  //           children: [
                  //             FittedBox(fit: BoxFit.contain, child: child),
                  //             if (detection != null &&
                  //                 width != null &&
                  //                 height != null)
                  //               Positioned.fill(
                  //                 child: Builder(
                  //                   builder: (context) {
                  //                     List<Widget> children = [];
                  //                     for (var item in detection) {
                  //                       children.add(
                  //                         Positioned(
                  //                           top: h * item.y,
                  //                           left: w * item.x,
                  //                           child: Container(
                  //                             decoration: BoxDecoration(
                  //                               border: Border.all(
                  //                                 color: primaryColor,
                  //                                 width: 2,
                  //                               ),
                  //                             ),
                  //                             height: item.height * h,
                  //                             width: item.width * w,
                  //                           ),
                  //                         ),
                  //                       );
                  //                       children.add(Positioned(
                  //                           bottom: h * (1 - item.y),
                  //                           left: w * item.x,
                  //                           child: Container(
                  //                             padding: const EdgeInsets.all(2),
                  //                             color: primaryColor,
                  //                             child: Text(
                  //                               item.name,
                  //                               style: const TextStyle(
                  //                                 color: Colors.white,
                  //                               ),
                  //                             ),
                  //                           )));
                  //                     }
                  //                     return Stack(
                  //                       children: children,
                  //                     );
                  //                   },
                  //                 ),
                  //               )
                  //           ],
                  //         );
                  //       },
                  //       // fit: BoxFit.fitWidth,
                  //     );
                  //   }),
                  // ),
                  //-------
                  CustomPaint(
                    foregroundPainter: DetectionPainter(detection),
                    child: Image.file(File(image.path)),
                  ),
                  //-----
                  // FittedBox(
                  //   fit: BoxFit.contain,
                  //   child: Stack(
                  //     children: [
                  //       Image.file(
                  //         File(image.path),
                  //         frameBuilder:
                  //             (context, child, frame, wasSynchronouslyLoaded) {
                  //           final image =
                  //               (child as Semantics).child as RawImage;
                  //           final width = image.image!.width;
                  //           final height = image.image!.height;
                  //           return Stack(
                  //             children: [
                  //               BoxFit(child: child),
                  //               if (detection != null)
                  //                 Positioned.fill(
                  //                   child: Builder(
                  //                     builder: (context) {
                  //                       List<Widget> children = [];
                  //                       for (var item in detection) {
                  //                         children.add(
                  //                           Positioned(
                  //                             top: height * item.y,
                  //                             left: width * item.x,
                  //                             child: Container(
                  //                               decoration: BoxDecoration(
                  //                                 border: Border.all(
                  //                                   color: primaryColor,
                  //                                   width: 2,
                  //                                 ),
                  //                               ),
                  //                               height: item.height * height,
                  //                               width: item.width * width,
                  //                               // child: Column(
                  //                               //   crossAxisAlignment:
                  //                               //       CrossAxisAlignment.start,
                  //                               //   children: [
                  //                               //     Container(
                  //                               //       padding: const EdgeInsets.all(2),
                  //                               //       color: primaryColor,
                  //                               //       child: Text(
                  //                               //         item.name,
                  //                               //         style: const TextStyle(
                  //                               //           color: Colors.white,
                  //                               //         ),
                  //                               //       ),
                  //                               //     )
                  //                               //   ],
                  //                               // ),
                  //                             ),
                  //                           ),
                  //                         );
                  //                         children.add(Positioned(
                  //                             bottom: height * (1 - item.y),
                  //                             left: width * item.x,
                  //                             child: Container(
                  //                               padding: const EdgeInsets.all(2),
                  //                               color: primaryColor,
                  //                               child: Text(
                  //                                 item.name,
                  //                                 style: const TextStyle(
                  //                                   color: Colors.white,
                  //                                 ),
                  //                               ),
                  //                             )));
                  //                       }
                  //                       return Stack(
                  //                         children: children,
                  //                       );
                  //                     },
                  //                   ),
                  //                 )
                  //             ],
                  //           );
                  //         },
                  //         // fit: BoxFit.fitWidth,
                  //       ),
                  //       if (detection != null)
                  //         Positioned.fill(
                  //           child: LayoutBuilder(
                  //             builder: (context, size) {
                  //               var width = size.maxWidth;
                  //               var height = size.maxHeight;
                  //               List<Widget> children = [];
                  //               for (var item in detection) {
                  //                 children.add(
                  //                   Positioned(
                  //                     top: height * item.y,
                  //                     left: width * item.x,
                  //                     child: Container(
                  //                       decoration: BoxDecoration(
                  //                         border: Border.all(
                  //                           color: primaryColor,
                  //                           width: 2,
                  //                         ),
                  //                       ),
                  //                       height: item.height * height,
                  //                       width: item.width * width,
                  //                       // child: Column(
                  //                       //   crossAxisAlignment:
                  //                       //       CrossAxisAlignment.start,
                  //                       //   children: [
                  //                       //     Container(
                  //                       //       padding: const EdgeInsets.all(2),
                  //                       //       color: primaryColor,
                  //                       //       child: Text(
                  //                       //         item.name,
                  //                       //         style: const TextStyle(
                  //                       //           color: Colors.white,
                  //                       //         ),
                  //                       //       ),
                  //                       //     )
                  //                       //   ],
                  //                       // ),
                  //                     ),
                  //                   ),
                  //                 );
                  //                 children.add(Positioned(
                  //                     bottom: height * (1 - item.y),
                  //                     left: width * item.x,
                  //                     child: Container(
                  //                       padding: const EdgeInsets.all(2),
                  //                       color: primaryColor,
                  //                       child: Text(
                  //                         item.name,
                  //                         style: const TextStyle(
                  //                           color: Colors.white,
                  //                         ),
                  //                       ),
                  //                     )));
                  //               }
                  //               return Stack(
                  //                 children: children,
                  //               );
                  //             },
                  //           ),
                  //         )
                  //       // Positioned.fill(
                  //       //   child: Container(
                  //       //     color: Colors.red.withOpacity(0.5),
                  //       //   ),
                  //       // )
                  //     ],
                  //   ),
                  // ),
                  // Positioned.fill(
                  //   child: Image.file(File(image.path), fit: BoxFit.contain,
                  //       frameBuilder:
                  //           (context, child, frame, wasSynchronouslyLoaded) {
                  //     return Stack(
                  //       fit: StackFit.loose,
                  //       children: [
                  //         child,
                  //         Container(
                  //           color: Colors.red.withOpacity(0.5),
                  //         )
                  //       ],
                  //     );
                  //   }),
                  // ),
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
              onPressed: () {},
              child: const Text('Сохранить'),
            ),
          )
        ],
      ),
    );
  }
}

class DetectionPainter extends CustomPainter {
  final List<DetectedClass>? detection;

  DetectionPainter(this.detection);

  @override
  void paint(Canvas canvas, Size size) {
    print(size);
    Paint paint = Paint()
      ..color = primaryColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    for (DetectedClass item in detection ?? []) {
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
