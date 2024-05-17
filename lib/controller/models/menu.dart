import 'package:json_annotation/json_annotation.dart';

part 'menu.g.dart';

@JsonSerializable()
class Item {
  final int id;
  final String title;
  final double price;
  final String image;
  final List<String> detailImages;
  final List<int> groups;
  final List<int> badges;

  Item({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.detailImages,
    required this.groups,
    required this.badges,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
