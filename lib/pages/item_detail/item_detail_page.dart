import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:table_order/controller/models/item.dart';
import 'package:table_order/controller/order_controller.dart';
import 'package:table_order/pages/item_detail/_item_detail_left.dart';
import 'package:table_order/pages/item_detail/_item_detail_right.dart';
import 'package:table_order/util.dart';

class ItemDetailPage extends StatelessWidget {
  final Item selectedItem;
  const ItemDetailPage({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    OrderController.to.init(selectedItem);

    return Scaffold(
      backgroundColor: Colors.transparent, // 배경을 투명하게
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          height: MediaQuery.of(context).size.height, // 화면 높이의 80%
          width: MediaQuery.of(context).size.width * 0.9, // 화면 폭의 80%
          color: Colors.indigo[50],
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.3, sigmaY: 1.3), // blur 효과
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: buildTopPanner(context)),
                Expanded(
                  flex: 7,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 6, child: ItemDetailLeft(item: selectedItem)),
                      Expanded(
                          flex: 6, child: ItemDetailRight(item: selectedItem)),
                    ],
                  ),
                ),
                Expanded(flex: 1, child: buildBottomPanner(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 상단 패널
  Widget buildTopPanner(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () => close(context),
            iconSize: 30,
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // 하단 패널
  Widget buildBottomPanner(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              close(context);
            },
            child: Container(
              width: 150,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.close, color: Colors.white),
                  Text(
                    '닫기',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          //
          GestureDetector(
            onTap: () {
              //
              close(context);
            },
            child: Container(
              width: 500,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.indigo.shade400,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Hero(
                    tag: 'cart',
                    child: const Icon(
                      Icons.shopping_cart_checkout,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    '담기',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Obx(
                    () => Text(
                      '(${Util.formatNumber(OrderController.to.getTotalPrice())}원)',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void close(BuildContext context) {
    Navigator.pop(context);
  }
}
