// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      minPick: (json['minPick'] as num).toInt(),
      maxPick: (json['maxPick'] as num).toInt(),
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'minPick': instance.minPick,
      'maxPick': instance.maxPick,
    };
