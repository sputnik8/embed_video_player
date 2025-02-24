import 'package:embed_video_player/src/models/video_config.dart';
import 'package:embed_video_player/src/models/video_response.dart';
import 'package:embed_video_player/src/models/video_source.dart';
import 'package:embed_video_player/src/data_sources/base_video_data_source.dart';
import 'package:embed_video_player/src/data_sources/iframe_data_source.dart';
import 'package:embed_video_player/src/data_sources/vk_video_data_source.dart';

class EmbedUrlRepository {
  final String? vkAccessToken;

  const EmbedUrlRepository({this.vkAccessToken});

  Future<VideoResponse> getVideoData(VideoConfig config) async {
    final provider = _getProvider(config.type);

    try {
      if (config.type == VideoSource.vk) {
        final vkProvider = provider as VkVideoDataSource;
        final vkResult = await vkProvider.getVideoData(config);

        final size = VideoSize(
          width: vkResult.size.width,
          height: vkResult.size.height,
        );

        return VideoResponse(
          html: vkResult.html,
          size: size,
          thumbnailUrl: vkResult.thumbnailUrl,
          isVertical: vkResult.size.height > vkResult.size.width,
        );
      } else {
        final html = await provider.getIframeHtml(config);

        return VideoResponse(
          html: html,
          size: const VideoSize(width: 16, height: 9),
          isVertical: false,
        );
      }
    } catch (e) {
      return VideoResponse(
        html: '',
        size: const VideoSize(width: 16, height: 9),
        error: e.toString(),
      );
    }
  }

  BaseVideoDataSource _getProvider(VideoSource type) {
    return switch (type) {
      VideoSource.vk => VkVideoDataSource(
          vkAccessToken ?? '',
          apiVersion: '5.099',
        ),
      VideoSource.youtube => throw UnimplementedError(),
      VideoSource.iframe => IframDataSource(),
    };
  }
}
