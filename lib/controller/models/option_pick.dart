import 'package:json_annotation/json_annotation.dart';

part 'option_pick.g.dart';

@JsonSerializable()
class OptionPick {
  final int id;
  final int optionId;
  final String title;
  final int price;
  final bool defaultPick;

  OptionPick({
    required this.id,
    required this.optionId,
    required this.title,
    required this.price,
    required this.defaultPick,
  });

  factory OptionPick.fromJson(Map<String, dynamic> json) =>
      _$OptionPickFromJson(json);
  Map<String, dynamic> toJson() => _$OptionPickToJson(this);
}
