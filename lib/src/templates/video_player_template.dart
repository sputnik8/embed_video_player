class VideoPlayerTemplate {
  static String getTemplate({required String embedding}) {
    return '''
      <!DOCTYPE html>
      <html>
        <head>
          <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
          <meta name="theme-color" content="transparent">
          <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
          <style>
            html, body {
              margin: 0;
              padding: 0;
              width: 100%;
              height: 100%;
              background: transparent;
              overflow: hidden;
              -webkit-overflow-scrolling: touch;
              -webkit-transform: translate3d(0,0,0);
              transform: translate3d(0,0,0);
              will-change: transform;
            }
            body {
              display: flex;
              justify-content: center;
              align-items: center;
              -webkit-transform-style: preserve-3d;
              transform-style: preserve-3d;
              -webkit-backface-visibility: hidden;
              backface-visibility: hidden;
              will-change: transform;
            }
            iframe {
              width: 100%;
              height: 100%;
              border: 0;
              position: absolute;
              top: 0;
              left: 0;
              right: 0;
              bottom: 0;
              -webkit-transform: translate3d(0,0,0);
              transform: translate3d(0,0,0);
              will-change: transform;
            }
            .iframe-container {
              position: relative;
              width: 100%;
              height: 100%;
              overflow: hidden;
              -webkit-transform: translate3d(0,0,0);
              transform: translate3d(0,0,0);
              will-change: transform;
            }
          </style>
          <script>
            document.documentElement.style.willChange = 'transform';
            document.documentElement.style.webkitTransform = 'translate3d(0,0,0)';
            document.documentElement.style.transform = 'translate3d(0,0,0)';
            document.body.style.willChange = 'transform';
            document.body.style.webkitTransform = 'translate3d(0,0,0)';
            document.body.style.transform = 'translate3d(0,0,0)';
            
            window.addEventListener('load', function() {
              var videos = document.getElementsByTagName('video');
              for(var i=0; i<videos.length; i++) {
                videos[i].setAttribute('playsinline', '');
                videos[i].setAttribute('webkit-playsinline', '');
                videos[i].setAttribute('x-webkit-airplay', 'allow');
                videos[i].style.willChange = 'transform';
                videos[i].style.transform = 'translate3d(0,0,0)';
                videos[i].style.webkitTransform = 'translate3d(0,0,0)';
                videos[i].style.position = 'relative';
                videos[i].style.zIndex = '1';
                
                videos[i].addEventListener('play', function() {
                  window.flutter_inappwebview.callHandler('onVideoEvent', 'play');
                });
                videos[i].addEventListener('pause', function() {
                  window.flutter_inappwebview.callHandler('onVideoEvent', 'pause');
                });
                videos[i].addEventListener('ended', function() {
                  window.flutter_inappwebview.callHandler('onVideoEvent', 'ended');
                });
                videos[i].addEventListener('seeking', function() {
                  window.flutter_inappwebview.callHandler('onSeeking');
                });
                videos[i].addEventListener('seeked', function() {
                  window.flutter_inappwebview.callHandler('onSeeked');
                });
                videos[i].addEventListener('error', function(e) {
                  window.flutter_inappwebview.callHandler('onVideoError', e.message);
                });
              }
              
              var iframes = document.getElementsByTagName('iframe');
              for(var i=0; i<iframes.length; i++) {
                iframes[i].setAttribute('allow', 'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share');
                iframes[i].setAttribute('allowfullscreen', 'true');
                iframes[i].setAttribute('webkitallowfullscreen', 'true');
                iframes[i].setAttribute('mozallowfullscreen', 'true');
                iframes[i].setAttribute('loading', 'eager');
                
                iframes[i].style.willChange = 'transform';
                iframes[i].style.transform = 'translate3d(0,0,0)';
                iframes[i].style.webkitTransform = 'translate3d(0,0,0)';
                iframes[i].style.position = 'relative';
                iframes[i].style.zIndex = '1';
                
                window.addEventListener('message', function(event) {
                  if (event.data === 'play') {
                    window.flutter_inappwebview.callHandler('onVideoEvent', 'play');
                  } else if (event.data === 'pause') {
                    window.flutter_inappwebview.callHandler('onVideoEvent', 'pause');
                  } else if (event.data === 'ended') {
                    window.flutter_inappwebview.callHandler('onVideoEvent', 'ended');
                  }
                });
              }
            });

            window.addEventListener('error', function(e) {
              window.flutter_inappwebview.callHandler('onVideoError', e.message);
            }, true);

            window.addEventListener('unhandledrejection', function(event) {
              window.flutter_inappwebview.callHandler('onVideoError', event.reason);
            });
          </script>
        </head>
        <body>
          <div class="iframe-container">
            $embedding
          </div>
        </body>
      </html>
    ''';
  }
}
