import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:table_order/controller/models/option.dart';
import 'package:table_order/controller/models/order.dart';
import 'package:table_order/controller/order_controller.dart';
import 'package:table_order/controller/repository/order_repo.dart';
import 'package:table_order/pages/widgets/line.dart';
import 'package:table_order/util/format_util.dart';

class OrderDetailPage extends StatelessWidget {
  OrderDetailPage({super.key});
  final _orderRepo = OrderRepo();
  final double _width = 0.7;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _orderRepo.getOrders(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Or some other placeholder.
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Scaffold(
            backgroundColor: Colors.transparent, // 배경을 투명하게
            body: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * _width, // 화면 폭의 80%
                color: Colors.indigo[50],
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.3, sigmaY: 1.3), // blur 효과
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(flex: 1, child: buildTopPanner(context)),
                      Expanded(
                          flex: 7,
                          child: buildOrderList(
                              context, snapshot.data as List<Order>)),
                      Expanded(flex: 1, child: buildBottomPanner(context)),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      }),
    );
  }

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

  Widget buildOrderList(BuildContext context, List<Order> orders) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return orderTile(context, orders[index]);
      },
    );
  }

  Widget orderTile(BuildContext context, Order order) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(20.0), // adjust the radius as needed
              child: Image.network(order.item.image),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(order.item.title,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    Text('${FormatUtil.formatNumber(order.total)} 원',
                        style: const TextStyle(fontSize: 20)),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Text('주문수량', style: TextStyle(fontSize: 20)),
                    ),
                    Expanded(
                      flex: 8,
                      child: Text(order.qtt.toString(),
                          style: const TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
                ...buildOtionDetail(context, order),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildOtionDetail(BuildContext context, Order order) {
    var options = <Widget>[];

    for (var option in order.pickOptions) {
      if (option.getPickOptions().isEmpty) continue;

      options.add(
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text('  ㄴ${option.optionGroup.title}',
                  style: const TextStyle(fontSize: 20)),
            ),
            Expanded(
              flex: 8,
              child: Text(buildOptionValue(context, option.getPickOptions()),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 20)),
            ),
          ],
        ),
        /*
        Column(children: [
          Text(option.optionGroup.title),
          ...buildOptionValue(context, option.getPickOptions())
        ]),
        */
      );
    }

    return options;
  }

  String buildOptionValue(BuildContext context, Set<Option> options) {
    List<String> optionValues = [];

    for (var option in options) {
      var str = option.price > 0
          ? '${option.title} (+${option.price}원)'
          : option.title;
      optionValues.add(str);
    }

    return optionValues.join(', ');
  }

  // 상단 패널

  // 하단 패널
  Widget buildBottomPanner(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width * _width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                close(context);
              },
              child: Container(
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
          ),
          const Spacer(), //
          Expanded(
            flex: 6,
            child: GestureDetector(
              onTap: () {
                saveAndClose(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * _width,
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
                      child: Icon(
                        Icons.wallet_sharp,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text(
                      '주문',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Obx(
                      () => Text(
                        '(${FormatUtil.formatNumber(OrderController.to.getTotalPrice())}원)',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void saveAndClose(BuildContext context) async {
    await OrderController.to.addOrder();
    close(context);
  }

  void close(BuildContext context) {
    Navigator.pop(context);
  }
}
