import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  final int tableId;
  final int itemId;
  int qtt;
  List<int> options;
  String memo;

  Order({
    required this.tableId,
    required this.itemId,
    required this.qtt,
    required this.options,
    required this.memo,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
