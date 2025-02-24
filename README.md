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

Пакет Flutter для встраивания видеоплееров из различных источников (ВКонтакте, YouTube и произвольные iframe) с использованием WebView. Пакет обеспечивает чёткое разделение между получением данных о видео и его отображением, что делает его гибким и простым в использовании.

## Возможности

- 🎥 Поддержка различных источников видео:
  - Видео из ВКонтакте
  - Видео из YouTube
  - Произвольные iframe-встройки
- 🔄 Автоматическая обработка соотношения сторон
- 📱 Адаптивный дизайн
- ⚡ Эффективное получение и кэширование данных видео
- 🎨 Современный пользовательский интерфейс
- 🔒 Обработка ошибок и состояний загрузки

## Установка

Добавьте в файл `pubspec.yaml` вашего проекта:

```yaml
dependencies:
  embed_video_player: ^1.0.0
```

## Использование

Пакет состоит из двух основных частей:
1. `EmbedUrlProviderService` - для получения данных о видео
2. `EmbedVideoPlayer` - для отображения видео

### Базовое использование

```dart
import 'package:embed_video_player/embed_video_player.dart';

// 1. Создаем конфигурацию видео
final videoConfig = VideoConfig(
  source: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
  type: VideoSource.youtube,
);

// 2. Инициализируем сервис
final videoService = EmbedUrlProviderService(
  vkAccessToken: 'ваш_токен_вк', // Необязательно, требуется только для видео ВК
);

// 3. Получаем данные о видео
final videoResponse = await videoService.getVideoData(videoConfig);

// 4. Отображаем видео
EmbedVideoPlayer(
  videoResponse: videoResponse,
  onError: (error) => print('Ошибка: $error'),
  onVideoComplete: () => print('Видео завершено'),
)
```

### Использование с разными источниками видео

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
    // Дополнительные параметры для ВК
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

### Обработка ошибок

Пакет предоставляет встроенную обработку ошибок с понятным пользовательским интерфейсом:

```dart
EmbedVideoPlayer(
  videoResponse: videoResponse,
  onError: (error) {
    // Обработка ошибки
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(error)),
    );
  },
)
```

### Продвинутое использование с управлением состоянием

Пример использования с Cubit:

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

// В вашем виджете
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

## Дополнительная информация

### Структура VideoResponse

Класс `VideoResponse` содержит:
- `html`: HTML-содержимое iframe
- `size`: Размеры видео (ширина и высота)
- `isVertical`: Является ли видео вертикальным
- `error`: Опциональное сообщение об ошибке
- `aspectRatio`: Рассчитанное соотношение сторон видео

### Настройка

Пакет автоматически обрабатывает соотношение сторон и адаптивный дизайн, но вы можете обернуть `EmbedVideoPlayer` в свой контейнер для управления его размером:

```dart
SizedBox(
  height: 400, // Пользовательская высота
  child: EmbedVideoPlayer(
    videoResponse: videoResponse,
  ),
)
```

## Участие в разработке

Мы приветствуем ваше участие в развитии пакета! Не стесняйтесь создавать Pull Request.

## Лицензия

```
MIT License

Copyright (c) 2024 Your Name

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
