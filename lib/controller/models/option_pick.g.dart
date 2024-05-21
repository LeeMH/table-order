// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_pick.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionPick _$OptionPickFromJson(Map<String, dynamic> json) => OptionPick(
      id: (json['id'] as num).toInt(),
      optionId: (json['optionId'] as num).toInt(),
      title: json['title'] as String,
      price: (json['price'] as num).toInt(),
      defaultPick: json['defaultPick'] as bool,
    );

Map<String, dynamic> _$OptionPickToJson(OptionPick instance) =>
    <String, dynamic>{
      'id': instance.id,
      'optionId': instance.optionId,
      'title': instance.title,
      'price': instance.price,
      'defaultPick': instance.defaultPick,
    };
