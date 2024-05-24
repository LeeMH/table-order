import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:table_order/controller/models/item.dart';
import 'package:table_order/util/format_util.dart';

class ItemDetailLeft extends StatelessWidget {
  final Item item;

  const ItemDetailLeft({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildCarousel(item),
          const SizedBox(height: 10),
          Text(
            item.title,
            style: const TextStyle(fontSize: 30),
          ),
          Text(
            FormatUtil.formatNumber(item.price.toInt()),
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }

  Widget buildCarousel(Item item) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        initialPage: 0,
        autoPlay: false,
      ),
      items: item.detailImages
          .map((item) => Container(
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // 모서리 둥글게
                    child: Image.network(
                      item,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
