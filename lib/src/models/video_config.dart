import 'package:embed_video_player/src/models/video_source.dart';

class VideoConfig {
  final String source;
  final VideoSource type;
  final Map<String, dynamic>? parameters;
  final bool autoPlay;
  final bool showControls;

  const VideoConfig({
    required this.source,
    required this.type,
    this.parameters,
    this.autoPlay = false,
    this.showControls = true,
  });

  Map<String, dynamic> toJson() {
    return {
      'source': source,
      'type': type.toString(),
      'parameters': parameters,
      'autoPlay': autoPlay,
      'showControls': showControls,
    };
  }
}
