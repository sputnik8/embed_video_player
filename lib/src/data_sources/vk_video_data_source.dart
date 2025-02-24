import 'package:dio/dio.dart';

import 'package:embed_video_player/src/models/video_config.dart';
import 'package:embed_video_player/src/models/video_response.dart';

import 'base_video_data_source.dart';

class VkVideoDataSource implements BaseVideoDataSource {
  final String _accessToken;
  final String apiVersion;
  final _dio = Dio();

  VkVideoDataSource(this._accessToken, {this.apiVersion = '5.131'});

  @override
  String get apiEndpoint => 'https://api.vk.com/method';

  @override
  String get apiKey => _accessToken;

  @override
  Map<String, String> get headers => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

  @override
  Future<Map<String, dynamic>> fetchFromApi(String videoUrl) async {
    try {
      final response = await _dio.get(
        '$apiEndpoint/video.getOembed',
        queryParameters: {
          'url': videoUrl,
          'access_token': _accessToken,
          'v': apiVersion,
        },
      );

      if (response.statusCode != 200) {
        throw VideoProviderException(
          'VK API error: ${response.statusMessage}',
        );
      }

      final data = response.data;
      if (data is! Map<String, dynamic>) {
        throw VideoProviderException('Invalid response format');
      }

      if (data.containsKey('error')) {
        final error = data['error'];
        throw VideoProviderException(
          'VK API error: ${error['error_msg'] ?? 'Unknown error'}',
        );
      }

      if (!data.containsKey('response')) {
        throw VideoProviderException('No response data found');
      }

      return data['response'] as Map<String, dynamic>;
    } on DioException catch (e) {
      throw VideoProviderException(
        'Failed to fetch VK video: ${e.message}',
      );
    }
  }

  @override
  String processApiResponse(Map<String, dynamic> response) {
    try {
      final html = response['html'] as String?;
      if (html == null || html.isEmpty) {
        throw VideoProviderException('No embed HTML found in response');
      }
      return html;
    } catch (e) {
      throw VideoProviderException('Failed to process VK response: $e');
    }
  }

  VideoResponse processFullResponse(Map<String, dynamic> response) {
    try {
      final html = response['html'] as String?;
      if (html == null || html.isEmpty) {
        throw VideoProviderException('No embed HTML found in response');
      }

      final width = response['width'] as int?;
      final height = response['height'] as int?;

      if (width == null || height == null) {
        throw VideoProviderException('Video dimensions not found in response');
      }

      return VideoResponse(
        html: html,
        size: VideoSize(width: width, height: height),
        thumbnailUrl: response['thumbnail_url'] as String?,
      );
    } catch (e) {
      throw VideoProviderException('Failed to process VK response: $e');
    }
  }

  @override
  Future<String> getIframeHtml(VideoConfig config) async {
    final response = await fetchFromApi(config.source);
    return processApiResponse(response);
  }

  Future<VideoResponse> getVideoData(VideoConfig config) async {
    final response = await fetchFromApi(config.source);
    return processFullResponse(response);
  }
}
