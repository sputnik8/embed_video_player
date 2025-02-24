import 'package:embed_video_player/src/models/video_config.dart';

abstract interface class BaseVideoDataSource {
  /// API endpoint for the service
  String get apiEndpoint;

  /// API key/token for the service
  String get apiKey;

  /// Headers required for API requests
  Map<String, String> get headers => {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      };

  /// Get iframe HTML using the platform's API
  Future<String> getIframeHtml(VideoConfig config) async {
    try {
      final response = await fetchFromApi(config.source);
      return processApiResponse(response);
    } catch (e) {
      throw VideoProviderException('Failed to get iframe: $e');
    }
  }

  /// Make API request to get embed information
  Future<Map<String, dynamic>> fetchFromApi(String videoUrl);

  /// Process API response into iframe HTML
  String processApiResponse(Map<String, dynamic> response);
}

class VideoProviderException implements Exception {
  final String message;
  VideoProviderException(this.message);

  @override
  String toString() => message;
}
