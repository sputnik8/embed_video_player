enum VideoSource {
  youtube,
  vk,
  iframe;

  bool get isDirectIframe => this == VideoSource.iframe;
}
