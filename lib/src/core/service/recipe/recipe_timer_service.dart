import '../stream_value.dart';
import '../timer_service.dart';
export '../stream_value.dart';
export '../timer_service.dart';

class RecipeTimerService {
  final Map<int, TimerService> _idTimerMap = {};

  Map<int, TimerService> get idTimerMap => _idTimerMap;

  final StreamValue<Set<int>> _idsValue = StreamValue({});

  StreamValue<Set<int>> get idsValue => _idsValue;

  updateIds() {
    _idsValue.value = _idTimerMap.keys.toSet();
  }

  start(int id, int seconds) {
    final currentTimer = _idTimerMap[id];
    currentTimer?.dispose();
    _idTimerMap[id] = TimerService(Duration(seconds: seconds));
    updateIds();
  }

  stop(int id) {
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
