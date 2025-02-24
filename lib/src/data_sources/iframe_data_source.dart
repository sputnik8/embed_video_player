import 'package:embed_video_player/src/models/video_config.dart';
import 'base_video_data_source.dart';

class IframDataSource implements BaseVideoDataSource {
  @override
  String get apiEndpoint => '';

  @override
  String get apiKey => '';

  @override
  Map<String, String> get headers => const {};

  @override
  Future<Map<String, dynamic>> fetchFromApi(String videoUrl) async {
    // For iframe provider, we don't need to fetch anything
    return {'html': videoUrl};
  }

  @override
  String processApiResponse(Map<String, dynamic> response) {
    return response['html'] as String;
  }

  @override
  Future<String> getIframeHtml(VideoConfig config) async {
    if (config.source.trim().isEmpty) {
      throw VideoProviderException('Iframe source cannot be empty');
    }

    // If the source is a complete iframe tag, return it as is
    if (config.source.trim().toLowerCase().startsWith('<iframe')) {
      return config.source;
    }

    // Otherwise, construct an iframe with the source URL
    final params = <String>[];

    if (config.autoPlay) {
      params.add('autoplay=1');
    }

    if (config.showControls) {
      params.add('controls=1');
    }

    // Add any additional parameters from the config
    if (config.parameters != null) {
      params.addAll(
        config.parameters!.entries.map(
          (e) => '${e.key}=${e.value}',
        ),
      );
    }

    final queryString = params.isNotEmpty ? '?${params.join('&')}' : '';
    final src = '${config.source}$queryString';

    return '''
      <iframe 
        src="$src"
        frameborder="0"
        allowfullscreen
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        style="width: 100%; height: 100%;"
      ></iframe>
    ''';
  }
}
