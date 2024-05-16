import 'package:json_annotation/json_annotation.dart';

part 'menu.g.dart';

@JsonSerializable()
class Menu {
  final int id;
  final String title;
  final double price;
  final String image;
  final List<String> detailImages;
  final List<int> groups;
  final List<int> badges;

  Menu({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.detailImages,
    required this.groups,
    required this.badges,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
  Map<String, dynamic> toJson() => _$MenuToJson(this);
}
