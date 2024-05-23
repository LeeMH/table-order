import 'package:json_annotation/json_annotation.dart';

part 'option_group.g.dart';

@JsonSerializable()
class OptionGroup {
  final int id;
  final String title;
  final int minPick;
  final int maxPick;

  OptionGroup({
    required this.id,
    required this.title,
    required this.minPick,
    required this.maxPick,
  });

  factory OptionGroup.fromJson(Map<String, dynamic> json) =>
      _$OptionGroupFromJson(json);
  Map<String, dynamic> toJson() => _$OptionGroupToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OptionGroup && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
