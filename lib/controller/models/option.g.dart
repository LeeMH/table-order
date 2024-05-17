// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      fixedCount: json['fixedCount'] as bool,
      maxCount: (json['maxCount'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => OptionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'fixedCount': instance.fixedCount,
      'maxCount': instance.maxCount,
      'items': instance.items,
    };
