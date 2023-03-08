import 'dart:async';

import 'stream_value.dart';

class TimerService {
  final Duration periodicDuration;
  final StreamValue<Duration> _currentDuration;
  final Duration duration;
  late Timer _timer;

  void dispose() {
    _timer.cancel();
    _currentDuration.dispose();
  }

  Stream<Duration> stream() {
    return _currentDuration().stream;
  }

  Duration get currentDuration => _currentDuration.value;
  void Function(dynamic service) onEnd;

  TimerService(this.duration, {required this.onEnd})
      : _currentDuration = StreamValue(duration),
        periodicDuration = const Duration(seconds: 1) {
    _timer = Timer.periodic(periodicDuration, (timer) {
      if (_currentDuration.value.isNegative ||
          _currentDuration.value == Duration.zero) {
        onEnd(this);
        return;
      }
      _currentDuration.value -= periodicDuration;
    });
  }
}
