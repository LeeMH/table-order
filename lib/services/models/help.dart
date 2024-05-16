import 'package:json_annotation/json_annotation.dart';

part 'help.g.dart';

@JsonSerializable()
class Help {
  final int id;
  final String title;

  Help({
    required this.id,
    required this.title,
  });

  factory Help.fromJson(Map<String, dynamic> json) => _$HelpFromJson(json);
  Map<String, dynamic> toJson() => _$HelpToJson(this);
}
