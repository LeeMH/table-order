import 'package:json_annotation/json_annotation.dart';

part 'option.g.dart';

@JsonSerializable()
class Option {
  final int id;
  final String title;
  final bool fixedCount;
  final int maxCount;
  final double price;

  Option({
    required this.id,
    required this.title,
    required this.fixedCount,
    required this.maxCount,
    required this.price,
  });

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
