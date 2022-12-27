import 'package:ik8_otus_food/src/core/extension/duration.dart';

extension IntEx on int {
  String get mmssDurationFormatFromSeconds {
    final duration = DurationStamp.calculate(seconds: this);
    String formatValue(int value) => value.toString().padLeft(2, '0');
    return '${formatValue(duration.minutes)}:${formatValue(duration.seconds)}';
  }
}
