// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      id: (json['id'] as num).toInt(),
      optionGroupId: (json['optionGroupId'] as num).toInt(),
      title: json['title'] as String,
      price: (json['price'] as num).toInt(),
      defaultPick: json['defaultPick'] as bool,
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'id': instance.id,
      'optionGroupId': instance.optionGroupId,
      'title': instance.title,
      'price': instance.price,
      'defaultPick': instance.defaultPick,
    };
