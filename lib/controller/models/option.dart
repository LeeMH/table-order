import 'package:json_annotation/json_annotation.dart';
import 'package:table_order/controller/models/option_item.dart';

part 'option.g.dart';

@JsonSerializable()
class Option {
  final int id;
  final String title;
  final bool fixedCount;
  final int maxCount;
  final List<OptionItem> items;

  Option({
    required this.id,
    required this.title,
    required this.fixedCount,
    required this.maxCount,
    required this.items,
  });

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
