// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      tableId: (json['tableId'] as num).toInt(),
      item: Item.fromJson(json['item'] as Map<String, dynamic>),
      qtt: (json['qtt'] as num).toInt(),
      pickOptions: (json['pickOptions'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      memo: json['memo'] as String,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'tableId': instance.tableId,
      'item': instance.item,
      'qtt': instance.qtt,
      'pickOptions': instance.pickOptions,
      'memo': instance.memo,
    };
