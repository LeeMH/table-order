import 'package:json_annotation/json_annotation.dart';

part 'option_item.g.dart';

@JsonSerializable()
class OptionItem {
  final int id;
  final String title;
  final double price;
  final bool defChoice;

  OptionItem({
    required this.id,
    required this.title,
    required this.price,
    required this.defChoice,
  });

  factory OptionItem.fromJson(Map<String, dynamic> json) =>
      _$OptionItemFromJson(json);
  Map<String, dynamic> toJson() => _$OptionItemToJson(this);
}
