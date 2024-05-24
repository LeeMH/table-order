import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:table_order/controller/models/option.dart';
import 'package:table_order/controller/models/order.dart';
import 'package:table_order/controller/order_controller.dart';
import 'package:table_order/controller/repository/order_repo.dart';
import 'package:table_order/util.dart';

class OrderDetailPage extends StatelessWidget {
  OrderDetailPage({super.key});
  final _orderRepo = OrderRepo();

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
    return ListTile(
      leading: Image.network(order.item.image),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(order.item.title),
          Text(Util.formatNumber(order.total)),
        ],
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('수량 : ${order.qtt}'),
        ],
      ),
      trailing: null,
    );
  }

  List<Widget> buildOtionDetail(BuildContext context, Order order) {
    var options = <Widget>[];

    for (var option in order.pickOptions) {
      options.add(
        Column(children: [
          Text('${option.optionGroup.title}'),
          ...buildOptionValue(context, option.getPickOptions())
        ]),
      );
    }

    return options;
  }

  List<Widget> buildOptionValue(BuildContext context, Set<Option> options) {
    var optionValues = <Widget>[];

    for (var option in options) {
      optionValues.add(
        Column(
          children: [
            Text('${option.title}'),
          ],
        ),
      );
    }

    return optionValues;
  }

  // 상단 패널

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
              saveAndClose(context);
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

  void saveAndClose(BuildContext context) async {
    await OrderController.to.addOrder();
    close(context);
  }

  void close(BuildContext context) {
    Navigator.pop(context);
  }
}
