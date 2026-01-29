class VideoSize {
  const VideoSize({required this.width, required this.height});

  final int width;
  final int height;

  factory VideoSize.fromJson(Map<String, dynamic> json) {
    return VideoSize(
      width: json['width'] as int,
      height: json['height'] as int,
    );
  }

  Map<String, dynamic> toJson() => {'width': width, 'height': height};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoSize &&
          runtimeType == other.runtimeType &&
          width == other.width &&
          height == other.height;

  @override
  int get hashCode => Object.hash(width, height);

  @override
  String toString() => 'VideoSize(width: $width, height: $height)';
}

class VideoResponse {
  const VideoResponse({
    required this.html,
    required this.size,
    this.thumbnailUrl,
    this.isVertical = false,
    this.error,
  });

  final String html;
  final VideoSize size;
  final String? thumbnailUrl;
  final bool isVertical;
  final String? error;

  factory VideoResponse.fromJson(Map<String, dynamic> json) {
    return VideoResponse(
      html: json['html'] as String,
      size: VideoSize.fromJson(json['size'] as Map<String, dynamic>),
      thumbnailUrl: json['thumbnailUrl'] as String?,
      isVertical: json['isVertical'] as bool? ?? false,
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'html': html,
    'size': size.toJson(),
    if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
    'isVertical': isVertical,
    if (error != null) 'error': error,
  };

  double get aspectRatio => size.width / size.height;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoResponse &&
          runtimeType == other.runtimeType &&
          html == other.html &&
          size == other.size &&
          thumbnailUrl == other.thumbnailUrl &&
          isVertical == other.isVertical &&
          error == other.error;

  @override
  int get hashCode => Object.hash(html, size, thumbnailUrl, isVertical, error);

  @override
  String toString() =>
      'VideoResponse(html: $html, size: $size, thumbnailUrl: $thumbnailUrl, isVertical: $isVertical, error: $error)';
}
