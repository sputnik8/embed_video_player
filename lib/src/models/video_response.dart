import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_response.freezed.dart';
part 'video_response.g.dart';

@freezed
class VideoSize with _$VideoSize {
  const factory VideoSize({
    required int width,
    required int height,
  }) = _VideoSize;

  factory VideoSize.fromJson(Map<String, dynamic> json) =>
      _$VideoSizeFromJson(json);
}

@freezed
class VideoResponse with _$VideoResponse {
  const factory VideoResponse({
    required String html,
    required VideoSize size,
    String? thumbnailUrl,
    @Default(false) bool isVertical,
    String? error,
  }) = _VideoResponse;

  factory VideoResponse.fromJson(Map<String, dynamic> json) =>
      _$VideoResponseFromJson(json);

  const VideoResponse._();

  double get aspectRatio => size.width / size.height;
}
