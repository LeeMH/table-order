// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionItem _$OptionItemFromJson(Map<String, dynamic> json) => OptionItem(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$OptionItemToJson(OptionItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
    };
