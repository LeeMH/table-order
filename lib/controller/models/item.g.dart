// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
      detailImages: (json['detailImages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String,
      maxOrderCount: (json['maxOrderCount'] as num).toInt(),
      groups: (json['groups'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      options: (json['options'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      badges: (json['badges'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'image': instance.image,
      'detailImages': instance.detailImages,
      'description': instance.description,
      'maxOrderCount': instance.maxOrderCount,
      'groups': instance.groups,
      'options': instance.options,
      'badges': instance.badges,
    };
