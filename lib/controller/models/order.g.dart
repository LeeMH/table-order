// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      item: Item.fromJson(json['item'] as Map<String, dynamic>),
      qtt: (json['qtt'] as num).toInt(),
      pickOptions: (json['pickOptions'] as List<dynamic>)
          .map((e) =>
              OptionGroupAndPickOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'item': instance.item,
      'qtt': instance.qtt,
      'pickOptions': instance.pickOptions,
      'total': instance.total,
    };
