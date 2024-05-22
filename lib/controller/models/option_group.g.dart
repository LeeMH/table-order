// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionGroup _$OptionGroupFromJson(Map<String, dynamic> json) => OptionGroup(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      minPick: (json['minPick'] as num).toInt(),
      maxPick: (json['maxPick'] as num).toInt(),
    );

Map<String, dynamic> _$OptionGroupToJson(OptionGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'minPick': instance.minPick,
      'maxPick': instance.maxPick,
    };
