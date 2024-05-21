import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_order/controller/models/item.dart';
import 'package:table_order/controller/models/option.dart';
import 'package:table_order/controller/models/option_pick.dart';
import 'package:table_order/controller/option_controller.dart';
import 'package:table_order/controller/order_controller.dart';
import 'package:table_order/pages/widgets/line.dart';
import 'package:table_order/util.dart';

class ItemDetailRight extends StatelessWidget {
  final Item item;
  ItemDetailRight({super.key, required this.item});

  final OptionController optionController = OptionController();

  @override
  Widget build(BuildContext context) {
    var optionFuture = optionController.getOptionsByItemId(item.id);
    var optionPickFuture = optionController.getOptionPickByItemId(item.id);
    return FutureBuilder(
        future: Future.wait([optionFuture, optionPickFuture]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Or some other placeholder.
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            var options = snapshot.data?[0] as List<Option>;
            var optionPicks = snapshot.data?[1] as List<OptionPick>;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    buildItemDescription(item), // 상품 설명
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Line(),
                    ),
                    buildQtt(item), // 수량
                    ...buildOptions(item, options, optionPicks), // 선택 옵션들
                  ],
                ),
              ),
            );
          }
        });
  }

  Widget buildItemDescription(Item item) {
    String description = item.description.replaceAll('<br>', '\n');
    bool needMore = description.split('\n').length > 2;
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '상품 설명',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 20),
          ),
          buildMoreText(needMore),
        ],
      ),
    );
  }

  Widget buildMoreText(bool needMore) {
    return needMore
        ? GestureDetector(
            onTap: () {
              // 더보기 아이콘 클릭 시 동작
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.more_horiz),
                Text(
                  '더보기',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )
        : const SizedBox();
  }

  Widget buildQtt(Item item) {
    bool onlyOne = item.maxOrderCount <= 1;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '수량 (최대 ${item.maxOrderCount}개)',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
        const SizedBox(height: 5), // 위젯 사이 간격 (10px
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildQttButton(onlyOne, Icons.remove, () {
              OrderController.to.minusQtt();
            }),
            Expanded(child: buildQttText(onlyOne)),
            buildQttButton(onlyOne, Icons.add, () {
              OrderController.to.plusQtt(item.maxOrderCount);
            }),
          ],
        ),
      ],
    );
  }

  Widget buildQttButton(bool onlyOne, IconData icon, Function() onPressed) {
    Color color = onlyOne ? Colors.grey : Colors.black;

    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: color),
      iconSize: 30,
    );
  }

  Widget buildQttText(bool onlyOne) {
    Color color = onlyOne ? Colors.grey : Colors.black;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // 박스의 모서리 둥글게
        border: Border.all(color: color), // 외곽선
        color: Colors.white, // 내부 배경색
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            OrderController.to.getQtt().toString(),
            style: TextStyle(fontSize: 30, color: color),
          ),
        ],
      ),
    );
  }

  List<Widget> buildOptions(
      Item item, List<Option> options, List<OptionPick> optionPicks) {
    var optionWidgets = <Widget>[];
    for (Option option in options) {
      var picks = optionPicks.where((p) => p.optionId == option.id).toList();
      optionWidgets.addAll(buildOptionTitle(option));
      optionWidgets.addAll(buildOptionPick(option, picks));
      optionWidgets.add(const SizedBox(height: 10));
    }

    return optionWidgets;
  }

  List<Widget> buildOptionTitle(Option option) {
    var count = '';
    if (option.minPick == option.maxPick) {
      count = '(${option.minPick}개 필수 선택)';
    } else {
      count = '(${option.minPick} ~ ${option.maxPick}개 선택)';
    }

    return [
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Line(),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            option.title,
            style: const TextStyle(fontSize: 20),
          ),
          SizedBox(width: 10),
          Text(
            count,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
      const SizedBox(height: 5), // 위젯 사이 간격 (10px
    ];
  }

  List<Widget> buildOptionPick(Option option, List<OptionPick> optionPicks) {
    var optionItems = <Widget>[]; // 옵션 아이템 위젯들을 담을 리스트

    for (OptionPick optionPick in optionPicks) {
      optionItems.add(buildOptionButton(option, optionPick));
      optionItems.add(const SizedBox(height: 5));
    }

    return optionItems;
  }

  Widget buildOptionButton(Option option, OptionPick optionPick) {
    return Obx(() {
      bool selected = OrderController.to.isSelectedOption(optionPick.id);
      Color color = selected ? Colors.black : Colors.grey;

      return GestureDetector(
        onTap: () {
          // 최대 수량이 넘어갔는지 체크해야 한다!!
          OrderController.to.updateOption(optionPick.id, option);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), // 박스의 모서리 둥글게
            border: Border.all(color: color), // 외곽선
            color: Colors.white, // 내부 배경색
          ),
          padding: EdgeInsets.all(5.0),
          child: Row(
            children: [
              Icon(
                Icons.check,
                color: color,
                weight: selected ? 20.0 : 10.0,
              ), // 체크 아이콘
              const SizedBox(width: 10), // 아이콘과 텍스트 사이 간격
              Text(
                optionPick.title,
                style: TextStyle(
                    fontSize: 20,
                    color: color,
                    fontWeight: selected ? FontWeight.bold : FontWeight.normal),
              ), // 옵션 텍스트
              const SizedBox(width: 10), // 아이콘과 텍스트 사이 간격
              Text(
                optionPick.price > 0
                    ? '(+${Util.formatNumber(optionPick.price)})'
                    : '',
                style: TextStyle(
                    fontSize: 18,
                    color: color,
                    fontWeight: selected ? FontWeight.bold : FontWeight.normal),
              ), // 옵션 텍스트
            ],
          ),
        ),
      );
    });
  }
}
