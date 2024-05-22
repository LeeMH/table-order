// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      tableId: (json['tableId'] as num).toInt(),
      itemId: (json['itemId'] as num).toInt(),
      qtt: (json['qtt'] as num).toInt(),
      pickOptions: (json['pickOptions'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      memo: json['memo'] as String,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'tableId': instance.tableId,
      'itemId': instance.itemId,
      'qtt': instance.qtt,
      'pickOptions': instance.pickOptions,
      'memo': instance.memo,
    };
