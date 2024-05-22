import 'package:json_annotation/json_annotation.dart';
import 'package:table_order/controller/models/item.dart';
import 'package:table_order/controller/models/option.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  final int tableId;
  final Item item;
  int qtt;
  List<Option> pickOptions;
  String memo;

  Order({
    required this.tableId,
    required this.item,
    required this.qtt,
    required this.pickOptions,
    required this.memo,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
