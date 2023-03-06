// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detected_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetectedObject {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  double get confidence => throw _privateConstructorUsedError;
  @HiveField(2)
  double get width => throw _privateConstructorUsedError;
  @HiveField(3)
  double get height => throw _privateConstructorUsedError;
  @HiveField(4)
  double get x => throw _privateConstructorUsedError;
  @HiveField(5)
  double get y => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetectedObjectCopyWith<DetectedObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetectedObjectCopyWith<$Res> {
  factory $DetectedObjectCopyWith(
          DetectedObject value, $Res Function(DetectedObject) then) =
      _$DetectedObjectCopyWithImpl<$Res, DetectedObject>;
  @useResult
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) double confidence,
      @HiveField(2) double width,
      @HiveField(3) double height,
      @HiveField(4) double x,
      @HiveField(5) double y});
}

/// @nodoc
class _$DetectedObjectCopyWithImpl<$Res, $Val extends DetectedObject>
    implements $DetectedObjectCopyWith<$Res> {
  _$DetectedObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? confidence = null,
    Object? width = null,
    Object? height = null,
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DetectedObjectCopyWith<$Res>
    implements $DetectedObjectCopyWith<$Res> {
  factory _$$_DetectedObjectCopyWith(
          _$_DetectedObject value, $Res Function(_$_DetectedObject) then) =
      __$$_DetectedObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) double confidence,
      @HiveField(2) double width,
      @HiveField(3) double height,
      @HiveField(4) double x,
      @HiveField(5) double y});
}

/// @nodoc
class __$$_DetectedObjectCopyWithImpl<$Res>
    extends _$DetectedObjectCopyWithImpl<$Res, _$_DetectedObject>
    implements _$$_DetectedObjectCopyWith<$Res> {
  __$$_DetectedObjectCopyWithImpl(
      _$_DetectedObject _value, $Res Function(_$_DetectedObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? confidence = null,
    Object? width = null,
    Object? height = null,
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_$_DetectedObject(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 135)
class _$_DetectedObject extends _DetectedObject {
  const _$_DetectedObject(
      {@HiveField(0) required this.name,
      @HiveField(1) required this.confidence,
      @HiveField(2) required this.width,
      @HiveField(3) required this.height,
      @HiveField(4) required this.x,
      @HiveField(5) required this.y})
      : super._();

  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  final double confidence;
  @override
  @HiveField(2)
  final double width;
  @override
  @HiveField(3)
  final double height;
  @override
  @HiveField(4)
  final double x;
  @override
  @HiveField(5)
  final double y;

  @override
  String toString() {
    return 'DetectedObject(name: $name, confidence: $confidence, width: $width, height: $height, x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetectedObject &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, confidence, width, height, x, y);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetectedObjectCopyWith<_$_DetectedObject> get copyWith =>
      __$$_DetectedObjectCopyWithImpl<_$_DetectedObject>(this, _$identity);
}

abstract class _DetectedObject extends DetectedObject {
  const factory _DetectedObject(
      {@HiveField(0) required final String name,
      @HiveField(1) required final double confidence,
      @HiveField(2) required final double width,
      @HiveField(3) required final double height,
      @HiveField(4) required final double x,
      @HiveField(5) required final double y}) = _$_DetectedObject;
  const _DetectedObject._() : super._();

  @override
  @HiveField(0)
  String get name;
  @override
  @HiveField(1)
  double get confidence;
  @override
  @HiveField(2)
  double get width;
  @override
  @HiveField(3)
  double get height;
  @override
  @HiveField(4)
  double get x;
  @override
  @HiveField(5)
  double get y;
  @override
  @JsonKey(ignore: true)
  _$$_DetectedObjectCopyWith<_$_DetectedObject> get copyWith =>
      throw _privateConstructorUsedError;
}
