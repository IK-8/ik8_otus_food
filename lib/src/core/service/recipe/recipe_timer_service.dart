import '../stream_value.dart';
import '../timer_service.dart';
export '../stream_value.dart';
export '../timer_service.dart';

class RecipeTimerService {
  final Map<dynamic, TimerService> _idTimerMap = {};

  Map<dynamic, TimerService> get idTimerMap => _idTimerMap;

  final StreamValue<Set<dynamic>> _idsValue = StreamValue({});

  StreamValue<Set<dynamic>> get idsValue => _idsValue;

  updateIds() {
    _idsValue.value = _idTimerMap.keys.toSet();
  }

  start(dynamic id, int seconds, {required void Function() onEnd}) {
    final currentTimer = _idTimerMap[id];
    currentTimer?.dispose();
    _idTimerMap[id] =
        TimerService(Duration(seconds: seconds), onEnd: (service) {
      stop(id);
      onEnd();
    });
    updateIds();
  }

  stop(dynamic id) {
    final currentTimer = _idTimerMap[id];
    currentTimer?.dispose();
    _idTimerMap.remove(id);
    updateIds();
  }

  dispose() {
    for (var timerService in _idTimerMap.values) {
      timerService.dispose();
    }
    _idTimerMap.clear();
    _idsValue.dispose();
  }
}
