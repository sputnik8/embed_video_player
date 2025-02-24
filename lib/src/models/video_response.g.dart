// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoSizeImpl _$$VideoSizeImplFromJson(Map<String, dynamic> json) =>
    _$VideoSizeImpl(
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
    );

Map<String, dynamic> _$$VideoSizeImplToJson(_$VideoSizeImpl instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };

_$VideoResponseImpl _$$VideoResponseImplFromJson(Map<String, dynamic> json) =>
    _$VideoResponseImpl(
      html: json['html'] as String,
      size: VideoSize.fromJson(json['size'] as Map<String, dynamic>),
      thumbnailUrl: json['thumbnailUrl'] as String?,
      isVertical: json['isVertical'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$VideoResponseImplToJson(_$VideoResponseImpl instance) =>
    <String, dynamic>{
      'html': instance.html,
      'size': instance.size,
      'thumbnailUrl': instance.thumbnailUrl,
      'isVertical': instance.isVertical,
      'error': instance.error,
    };
