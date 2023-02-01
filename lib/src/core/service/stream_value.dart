import 'dart:async';

class StreamValue<T> {
  T _value;
  final _streamController = StreamController<T>.broadcast();

  StreamValue(this._value) {
    _streamController.add(_value);
  }

  T get value => _value;

  set value(T value) {
    _value = value;
    _streamController.add(value);
  }

  Future<void> dispose() {
    return _streamController.close();
  }

  StreamController<T> call() => _streamController;
}
