import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  final int id;
  final String title;
  final int price;
  final String image;
  final List<String> detailImages;
  final String description;
  final int maxOrderCount;

  Item({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.detailImages,
    required this.description,
    required this.maxOrderCount,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
