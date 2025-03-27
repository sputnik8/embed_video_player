import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'package:embed_video_player/embed_video_player.dart';

class MockVideoDataSource extends Mock implements BaseVideoDataSource {}

class MockInAppWebViewPlatform extends InAppWebViewPlatform {
  @override
  PlatformInAppWebViewController createPlatformInAppWebViewController(
    PlatformInAppWebViewControllerCreationParams params,
  ) {
    return MockPlatformInAppWebViewController();
  }

  @override
  PlatformInAppWebViewWidget createPlatformInAppWebViewWidget(
    PlatformInAppWebViewWidgetCreationParams params,
  ) {
    return MockPlatformInAppWebViewWidget();
  }

  @override
  PlatformInAppWebViewController createPlatformInAppWebViewControllerStatic() {
    return MockPlatformInAppWebViewController();
  }
}

class MockPlatformInAppWebViewController extends Fake
    with MockPlatformInterfaceMixin
    implements PlatformInAppWebViewController {
  @override
  Future<void> loadData({
    required String data,
    String mimeType = "text/html",
    String encoding = "utf8",
    WebUri? baseUrl,
    WebUri? historyUrl,
    Uri? androidHistoryUrl,
    Uri? iosAllowingReadAccessTo,
    WebUri? allowingReadAccessTo,
  }) async {}

  @override
  void addJavaScriptHandler({
    required String handlerName,
    required Function callback,
  }) {}

  @override
  Future<void> setWebContentsDebuggingEnabled(bool enabled) async {}
}

class MockPlatformInAppWebViewWidget extends Fake
    with MockPlatformInterfaceMixin
    implements PlatformInAppWebViewWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }

  @override
  T controllerFromPlatform<T>(
    PlatformInAppWebViewController controller,
  ) {
    return controller as T;
  }

  @override
  void dispose() {}
}

void main() {
  late VideoResponse videoResponse;

  setUpAll(() {
    InAppWebViewPlatform.instance = MockInAppWebViewPlatform();
  });

  setUp(() {
    videoResponse = const VideoResponse(
      html: '<iframe src="https://example.com"></iframe>',
      size: VideoSize(width: 16, height: 9),
      isVertical: false,
    );
  });

  testWidgets('should show error message on failure',
      (WidgetTester tester) async {
    const errorResponse = VideoResponse(
      html: '',
      size: VideoSize(width: 16, height: 9),
      isVertical: false,
      error: 'Test error message',
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: EmbedVideoPlayer(
            videoResponse: errorResponse,
          ),
        ),
      ),
    );

    await tester.pump();

    expect(find.text('Error: Test error message'), findsOneWidget);
    expect(find.byType(InAppWebView), findsNothing);
  });

  testWidgets('should show InAppWebView when no error',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EmbedVideoPlayer(
            videoResponse: videoResponse,
          ),
        ),
      ),
    );

    await tester.pump();

    expect(find.byType(InAppWebView), findsOneWidget);
  });
}
