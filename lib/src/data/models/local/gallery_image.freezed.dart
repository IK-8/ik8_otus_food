// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GalleryImage {
  @HiveField(0)
  dynamic get recipeId => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(2)
  Uint8List get data => throw _privateConstructorUsedError;
  @HiveField(3)
  List<DetectedObject> get detected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GalleryImageCopyWith<GalleryImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryImageCopyWith<$Res> {
  factory $GalleryImageCopyWith(
          GalleryImage value, $Res Function(GalleryImage) then) =
      _$GalleryImageCopyWithImpl<$Res, GalleryImage>;
  @useResult
  $Res call(
      {@HiveField(0) dynamic recipeId,
      @HiveField(1) String? description,
      @HiveField(2) Uint8List data,
      @HiveField(3) List<DetectedObject> detected});
}

/// @nodoc
class _$GalleryImageCopyWithImpl<$Res, $Val extends GalleryImage>
    implements $GalleryImageCopyWith<$Res> {
  _$GalleryImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeId = freezed,
    Object? description = freezed,
    Object? data = null,
    Object? detected = null,
  }) {
    return _then(_value.copyWith(
      recipeId: freezed == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      detected: null == detected
          ? _value.detected
          : detected // ignore: cast_nullable_to_non_nullable
              as List<DetectedObject>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GalleryImageCopyWith<$Res>
    implements $GalleryImageCopyWith<$Res> {
  factory _$$_GalleryImageCopyWith(
          _$_GalleryImage value, $Res Function(_$_GalleryImage) then) =
      __$$_GalleryImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) dynamic recipeId,
      @HiveField(1) String? description,
      @HiveField(2) Uint8List data,
      @HiveField(3) List<DetectedObject> detected});
}

/// @nodoc
class __$$_GalleryImageCopyWithImpl<$Res>
    extends _$GalleryImageCopyWithImpl<$Res, _$_GalleryImage>
    implements _$$_GalleryImageCopyWith<$Res> {
  __$$_GalleryImageCopyWithImpl(
      _$_GalleryImage _value, $Res Function(_$_GalleryImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeId = freezed,
    Object? description = freezed,
    Object? data = null,
    Object? detected = null,
  }) {
    return _then(_$_GalleryImage(
      recipeId: freezed == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      detected: null == detected
          ? _value._detected
          : detected // ignore: cast_nullable_to_non_nullable
              as List<DetectedObject>,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 136)
class _$_GalleryImage with DiagnosticableTreeMixin implements _GalleryImage {
  const _$_GalleryImage(
      {@HiveField(0) this.recipeId,
      @HiveField(1) this.description,
      @HiveField(2) required this.data,
      @HiveField(3) required final List<DetectedObject> detected})
      : _detected = detected;

  @override
  @HiveField(0)
  final dynamic recipeId;
  @override
  @HiveField(1)
  final String? description;
  @override
  @HiveField(2)
  final Uint8List data;
  final List<DetectedObject> _detected;
  @override
  @HiveField(3)
  List<DetectedObject> get detected {
    if (_detected is EqualUnmodifiableListView) return _detected;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_detected);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GalleryImage(recipeId: $recipeId, description: $description, data: $data, detected: $detected)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GalleryImage'))
      ..add(DiagnosticsProperty('recipeId', recipeId))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('detected', detected));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GalleryImage &&
            const DeepCollectionEquality().equals(other.recipeId, recipeId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other._detected, _detected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(recipeId),
      description,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(_detected));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GalleryImageCopyWith<_$_GalleryImage> get copyWith =>
      __$$_GalleryImageCopyWithImpl<_$_GalleryImage>(this, _$identity);
}

abstract class _GalleryImage implements GalleryImage {
  const factory _GalleryImage(
          {@HiveField(0) final dynamic recipeId,
          @HiveField(1) final String? description,
          @HiveField(2) required final Uint8List data,
          @HiveField(3) required final List<DetectedObject> detected}) =
      _$_GalleryImage;

  @override
  @HiveField(0)
  dynamic get recipeId;
  @override
  @HiveField(1)
  String? get description;
  @override
  @HiveField(2)
  Uint8List get data;
  @override
  @HiveField(3)
  List<DetectedObject> get detected;
  @override
  @JsonKey(ignore: true)
  _$$_GalleryImageCopyWith<_$_GalleryImage> get copyWith =>
      throw _privateConstructorUsedError;
}
