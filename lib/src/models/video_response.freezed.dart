// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VideoSize _$VideoSizeFromJson(Map<String, dynamic> json) {
  return _VideoSize.fromJson(json);
}

/// @nodoc
mixin _$VideoSize {
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;

  /// Serializes this VideoSize to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VideoSize
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoSizeCopyWith<VideoSize> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoSizeCopyWith<$Res> {
  factory $VideoSizeCopyWith(VideoSize value, $Res Function(VideoSize) then) =
      _$VideoSizeCopyWithImpl<$Res, VideoSize>;
  @useResult
  $Res call({int width, int height});
}

/// @nodoc
class _$VideoSizeCopyWithImpl<$Res, $Val extends VideoSize>
    implements $VideoSizeCopyWith<$Res> {
  _$VideoSizeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoSize
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_value.copyWith(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoSizeImplCopyWith<$Res>
    implements $VideoSizeCopyWith<$Res> {
  factory _$$VideoSizeImplCopyWith(
          _$VideoSizeImpl value, $Res Function(_$VideoSizeImpl) then) =
      __$$VideoSizeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int width, int height});
}

/// @nodoc
class __$$VideoSizeImplCopyWithImpl<$Res>
    extends _$VideoSizeCopyWithImpl<$Res, _$VideoSizeImpl>
    implements _$$VideoSizeImplCopyWith<$Res> {
  __$$VideoSizeImplCopyWithImpl(
      _$VideoSizeImpl _value, $Res Function(_$VideoSizeImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoSize
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_$VideoSizeImpl(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoSizeImpl implements _VideoSize {
  const _$VideoSizeImpl({required this.width, required this.height});

  factory _$VideoSizeImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoSizeImplFromJson(json);

  @override
  final int width;
  @override
  final int height;

  @override
  String toString() {
    return 'VideoSize(width: $width, height: $height)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoSizeImpl &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, width, height);

  /// Create a copy of VideoSize
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoSizeImplCopyWith<_$VideoSizeImpl> get copyWith =>
      __$$VideoSizeImplCopyWithImpl<_$VideoSizeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoSizeImplToJson(
      this,
    );
  }
}

abstract class _VideoSize implements VideoSize {
  const factory _VideoSize(
      {required final int width, required final int height}) = _$VideoSizeImpl;

  factory _VideoSize.fromJson(Map<String, dynamic> json) =
      _$VideoSizeImpl.fromJson;

  @override
  int get width;
  @override
  int get height;

  /// Create a copy of VideoSize
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoSizeImplCopyWith<_$VideoSizeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VideoResponse _$VideoResponseFromJson(Map<String, dynamic> json) {
  return _VideoResponse.fromJson(json);
}

/// @nodoc
mixin _$VideoResponse {
  String get html => throw _privateConstructorUsedError;
  VideoSize get size => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  bool get isVertical => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this VideoResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VideoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoResponseCopyWith<VideoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoResponseCopyWith<$Res> {
  factory $VideoResponseCopyWith(
          VideoResponse value, $Res Function(VideoResponse) then) =
      _$VideoResponseCopyWithImpl<$Res, VideoResponse>;
  @useResult
  $Res call(
      {String html,
      VideoSize size,
      String? thumbnailUrl,
      bool isVertical,
      String? error});

  $VideoSizeCopyWith<$Res> get size;
}

/// @nodoc
class _$VideoResponseCopyWithImpl<$Res, $Val extends VideoResponse>
    implements $VideoResponseCopyWith<$Res> {
  _$VideoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? html = null,
    Object? size = null,
    Object? thumbnailUrl = freezed,
    Object? isVertical = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      html: null == html
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as VideoSize,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isVertical: null == isVertical
          ? _value.isVertical
          : isVertical // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of VideoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VideoSizeCopyWith<$Res> get size {
    return $VideoSizeCopyWith<$Res>(_value.size, (value) {
      return _then(_value.copyWith(size: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VideoResponseImplCopyWith<$Res>
    implements $VideoResponseCopyWith<$Res> {
  factory _$$VideoResponseImplCopyWith(
          _$VideoResponseImpl value, $Res Function(_$VideoResponseImpl) then) =
      __$$VideoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String html,
      VideoSize size,
      String? thumbnailUrl,
      bool isVertical,
      String? error});

  @override
  $VideoSizeCopyWith<$Res> get size;
}

/// @nodoc
class __$$VideoResponseImplCopyWithImpl<$Res>
    extends _$VideoResponseCopyWithImpl<$Res, _$VideoResponseImpl>
    implements _$$VideoResponseImplCopyWith<$Res> {
  __$$VideoResponseImplCopyWithImpl(
      _$VideoResponseImpl _value, $Res Function(_$VideoResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? html = null,
    Object? size = null,
    Object? thumbnailUrl = freezed,
    Object? isVertical = null,
    Object? error = freezed,
  }) {
    return _then(_$VideoResponseImpl(
      html: null == html
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as VideoSize,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isVertical: null == isVertical
          ? _value.isVertical
          : isVertical // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoResponseImpl extends _VideoResponse {
  const _$VideoResponseImpl(
      {required this.html,
      required this.size,
      this.thumbnailUrl,
      this.isVertical = false,
      this.error})
      : super._();

  factory _$VideoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoResponseImplFromJson(json);

  @override
  final String html;
  @override
  final VideoSize size;
  @override
  final String? thumbnailUrl;
  @override
  @JsonKey()
  final bool isVertical;
  @override
  final String? error;

  @override
  String toString() {
    return 'VideoResponse(html: $html, size: $size, thumbnailUrl: $thumbnailUrl, isVertical: $isVertical, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoResponseImpl &&
            (identical(other.html, html) || other.html == html) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.isVertical, isVertical) ||
                other.isVertical == isVertical) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, html, size, thumbnailUrl, isVertical, error);

  /// Create a copy of VideoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoResponseImplCopyWith<_$VideoResponseImpl> get copyWith =>
      __$$VideoResponseImplCopyWithImpl<_$VideoResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoResponseImplToJson(
      this,
    );
  }
}

abstract class _VideoResponse extends VideoResponse {
  const factory _VideoResponse(
      {required final String html,
      required final VideoSize size,
      final String? thumbnailUrl,
      final bool isVertical,
      final String? error}) = _$VideoResponseImpl;
  const _VideoResponse._() : super._();

  factory _VideoResponse.fromJson(Map<String, dynamic> json) =
      _$VideoResponseImpl.fromJson;

  @override
  String get html;
  @override
  VideoSize get size;
  @override
  String? get thumbnailUrl;
  @override
  bool get isVertical;
  @override
  String? get error;

  /// Create a copy of VideoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoResponseImplCopyWith<_$VideoResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
