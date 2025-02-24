<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# Embed Video Player

Внутренняя документация по пакету для встраивания видеоплееров.

## Описание

Пакет Flutter для встраивания видеоплееров из различных источников (ВКонтакте, YouTube и произвольные iframe) с использованием WebView. Пакет обеспечивает чёткое разделение между получением данных о видео и его отображением.

## Подключение пакета

Добавьте зависимость в `pubspec.yaml`:

```yaml
dependencies:
  embed_video_player:
    path: packages/embed_video_player  # Путь к локальному пакету
```

## Использование

### Базовый пример

```dart
import 'package:embed_video_player/embed_video_player.dart';

// 1. Создание конфигурации видео
final videoConfig = VideoConfig(
  source: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
  type: VideoSource.youtube,
);

// 2. Инициализация сервиса
final videoService = EmbedUrlProviderService(
  vkAccessToken: 'ваш_токен_вк', // Опционально, только для ВК
);

// 3. Получение данных видео
final videoResponse = await videoService.getVideoData(videoConfig);

// 4. Отображение видео
EmbedVideoPlayer(
  videoResponse: videoResponse,
  onError: (error) => print('Ошибка: $error'),
  onVideoComplete: () => print('Видео завершено'),
)
```

### Примеры конфигурации для разных источников

#### YouTube
```dart
final youtubeConfig = VideoConfig(
  source: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
  type: VideoSource.youtube,
);
```

#### ВКонтакте
```dart
final vkConfig = VideoConfig(
  source: 'https://vk.com/video-12345_67890',
  type: VideoSource.vk,
  parameters: {
    'hd': '1',
  },
);
```

#### Произвольный Iframe
```dart
final iframeConfig = VideoConfig(
  source: 'https://example.com/embed/video',
  type: VideoSource.iframe,
);
```

## Интеграция с Cubit

Рекомендуемый способ использования с управлением состоянием:

```dart
class VideoPlayerCubit extends Cubit<VideoState> {
  final EmbedUrlProviderService _service;

  VideoPlayerCubit(this._service) : super(VideoState.initial());

  Future<void> loadVideo(VideoConfig config) async {
    emit(state.copyWith(isLoading: true));
    
    try {
      final response = await _service.getVideoData(config);
      emit(state.copyWith(
        videoResponse: response,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        isLoading: false,
      ));
    }
  }
}

// Использование в виджете
BlocBuilder<VideoPlayerCubit, VideoState>(
  builder: (context, state) {
    if (state.isLoading) {
      return const CircularProgressIndicator();
    }
    
    if (state.videoResponse != null) {
      return EmbedVideoPlayer(
        videoResponse: state.videoResponse!,
        onError: (error) => context.read<VideoPlayerCubit>().handleError(error),
      );
    }
    
    return const SizedBox();
  },
)
```

## Структура данных

### VideoResponse
```dart
class VideoResponse {
  final String html;          // HTML-содержимое iframe
  final Size size;           // Размеры видео
  final bool isVertical;     // Вертикальное ли видео
  final String? error;       // Сообщение об ошибке
  final double aspectRatio;  // Соотношение сторон
}
```

## Кастомизация размеров

Для управления размером плеера используйте стандартные виджеты Flutter:

```dart
SizedBox(
  height: 400,
  child: EmbedVideoPlayer(
    videoResponse: videoResponse,
  ),
)
```

## Обработка ошибок

Плеер автоматически отображает ошибки, но вы можете добавить свою обработку:

```dart
EmbedVideoPlayer(
  videoResponse: videoResponse,
  onError: (error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(error)),
    );
  },
)
```