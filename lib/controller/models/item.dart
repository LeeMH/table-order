import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  final int id;
  final String title;
  final double price;
  final String image;
  final List<String> detailImages;
  final String description;
  final int maxOrderCount;
  final List<int> groups;
  final List<int> options;
  final List<int> badges;

  Item({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.detailImages,
    required this.description,
    required this.maxOrderCount,
    required this.groups,
    required this.options,
    required this.badges,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
