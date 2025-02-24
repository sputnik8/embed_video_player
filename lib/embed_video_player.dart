import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:embed_video_player/src/models/video_response.dart';
import 'package:embed_video_player/src/templates/video_player_template.dart';

export 'src/models/video_config.dart';
export 'src/models/video_response.dart';
export 'src/models/video_source.dart';
export 'src/repositories/embed_url_repository.dart';
export 'src/data_sources/base_video_data_source.dart';

export 'src/data_sources/vk_video_data_source.dart';
export 'src/data_sources/iframe_data_source.dart';

class EmbedVideoPlayer extends StatefulWidget {
  final VideoResponse videoResponse;
  final void Function(String)? onError;
  final void Function()? onVideoComplete;
  final double? maxHeight;

  const EmbedVideoPlayer({
    super.key,
    required this.videoResponse,
    this.onError,
    this.onVideoComplete,
    this.maxHeight,
  });

  @override
  State<EmbedVideoPlayer> createState() => _EmbedVideoPlayerState();
}

class _EmbedVideoPlayerState extends State<EmbedVideoPlayer> {
  late final InAppWebViewController _controller;
  WebViewEnvironment? webViewEnvironment;
  bool _isLoading = true;

  @override
  void initState() {
    _initializeWebview();
    super.initState();
  }

  Future<void> _initializeWebview() async {
    WidgetsFlutterBinding.ensureInitialized();

    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
    }
  }

  Future<void> _loadContent() async {
    if (!mounted) return;

    try {
      await _controller.loadData(
        data: VideoPlayerTemplate.getTemplate(
            embedding: widget.videoResponse.html),
      );
    } catch (e) {
      _handleError(e.toString());
    }
  }

  void _handleError(String error) {
    if (!mounted) return;

    log('Video player error: $error');
    setState(() {
      _isLoading = false;
    });
    widget.onError?.call(error);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final maxHeight = widget.maxHeight ?? screenSize.height;
    final maxWidth = screenSize.width;

    double containerHeight;
    double containerWidth;

    if (widget.videoResponse.isVertical) {
      containerHeight = maxHeight;
      containerWidth = maxHeight * widget.videoResponse.aspectRatio;
      if (containerWidth > maxWidth) {
        containerWidth = maxWidth;
        containerHeight = maxWidth / widget.videoResponse.aspectRatio;
      }
    } else {
      containerWidth = maxWidth;
      containerHeight = maxWidth / widget.videoResponse.aspectRatio;
      if (containerHeight > maxHeight) {
        containerHeight = maxHeight;
        containerWidth = maxHeight * widget.videoResponse.aspectRatio;
      }
    }

    if (widget.videoResponse.error != null) {
      return Center(
        child: SizedBox(
          width: containerWidth,
          height: containerHeight,
          child: Center(
            child: Text(
              'Error: ${widget.videoResponse.error}',
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    return Center(
      child: SizedBox(
        width: containerWidth,
        height: containerHeight,
        child: Stack(
          children: [
            if (widget.videoResponse.thumbnailUrl != null && _isLoading)
              if (_isLoading) const Center(child: CircularProgressIndicator()),
            InAppWebView(
              webViewEnvironment: webViewEnvironment,
              onWebViewCreated: (controller) {
                _controller = controller;
                controller.addJavaScriptHandler(
                  handlerName: 'onVideoEvent',
                  callback: (args) {
                    final event = args[0] as String;
                    log('Video event: $event');
                    if (event == 'ended') {
                      widget.onVideoComplete?.call();
                    }
                  },
                );

                controller.addJavaScriptHandler(
                  handlerName: 'onVideoError',
                  callback: (args) {
                    final error = args[0] as String;
                    _handleError('Video error: $error');
                  },
                );

                _loadContent();
              },
              initialSettings: InAppWebViewSettings(
                useShouldOverrideUrlLoading: false,
                mediaPlaybackRequiresUserGesture: false,
                transparentBackground: true,
                supportZoom: false,
                disableHorizontalScroll: true,
                disableVerticalScroll: true,
                useOnLoadResource: true,
                javaScriptEnabled: true,
                useHybridComposition: true,
              ),
              onProgressChanged: (controller, progress) {
                if (progress == 100) {
                  setState(() {
                    _isLoading = false;
                  });
                }
              },
              onNavigationResponse: (controller, response) async {
                if (response.isForMainFrame) {
                  controller.evaluateJavascript(
                      source:
                          'window.flutter_inappwebview.callHandler("onVideoEvent", "play");');
                }
                return NavigationResponseAction.ALLOW;
              },
              onReceivedError: (controller, url, response) {
                _handleError('Load error: ${response.description}');
              },
              onReceivedHttpError: (controller, url, response) {
                _handleError('HTTP error: ${response.statusCode}');
              },
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                final url = navigationAction.request.url?.toString() ?? '';

                if (getNavigationCancelPolicyVk(url)) {
                  return NavigationActionPolicy.CANCEL;
                }

                return NavigationActionPolicy.ALLOW;
              },
            ),
          ],
        ),
      ),
    );
  }

  bool getNavigationCancelPolicyVk(String url) {
    return url.startsWith('vkvideo://') ||
        url.startsWith('vk://') ||
        (!url.startsWith('http://') &&
            !url.startsWith('https://') &&
            !url.startsWith('about:'));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
