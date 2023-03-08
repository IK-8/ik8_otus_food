import 'package:flutter/material.dart';

import '../../../config/theme/main.dart';
import '../../../data/models/local/detected_object.dart';

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
  bool shouldRepaint(covariant DetectionPainter oldDelegate) =>
      detection != oldDelegate.detection || hidden != oldDelegate.hidden;
}
