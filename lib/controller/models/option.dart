import 'package:json_annotation/json_annotation.dart';

part 'option.g.dart';

@JsonSerializable()
class Option {
  final int id;
  final int optionGroupId;
  final String title;
  final int price;
  final bool defaultPick;

  Option({
    required this.id,
    required this.optionGroupId,
    required this.title,
    required this.price,
    required this.defaultPick,
  });

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
