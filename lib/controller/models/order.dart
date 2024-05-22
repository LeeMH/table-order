import 'package:table_order/controller/models/item.dart';
import 'package:table_order/controller/models/option.dart';

class Order {
  final Item item;
  int qtt;
  List<Option> pickOptions;
  int total;

  Item getItem() => item;
  int getQtt() => qtt;
  List<Option> getPickOptions() => pickOptions;
  int getTotal() => total;

  Order({
    required this.item,
    required this.qtt,
    required this.pickOptions,
    required this.total,
  });
}
