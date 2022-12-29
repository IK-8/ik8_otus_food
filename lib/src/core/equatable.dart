import 'package:equatable/equatable.dart';

class EquatableList<T> extends Equatable {
  final List<T> list;

  const EquatableList(this.list);

  @override
  List<T> get props => list;
}
