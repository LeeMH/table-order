import 'package:json_annotation/json_annotation.dart';

part 'option.g.dart';

@JsonSerializable()
class Option {
  final int id;
  final String title;
  final int minPick;
  final int maxPick;

  Option({
    required this.id,
    required this.title,
    required this.minPick,
    required this.maxPick,
  });

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
