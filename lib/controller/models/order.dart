import 'package:json_annotation/json_annotation.dart';
import 'package:table_order/controller/models/item.dart';
import 'package:table_order/controller/models/option.dart';
import 'package:table_order/controller/models/option_group.dart';
import 'package:table_order/controller/models/option_group_and_options.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  final Item item;
  int qtt;
  List<OptionGroupAndPickOptions> pickOptions;
  int total;

  Item getItem() => item;
  int getQtt() => qtt;
  List<OptionGroupAndPickOptions> getPickOptions() => pickOptions;
  int getTotal() => total;

  Order({
    required this.item,
    required this.qtt,
    required this.pickOptions,
    required this.total,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
