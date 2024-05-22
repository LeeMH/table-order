import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_order/controller/help_controller.dart';
import 'package:table_order/controller/models/help.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // 배경을 투명하게
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          height: MediaQuery.of(context).size.height, // 화면 높이의 80%
          width: MediaQuery.of(context).size.width * 0.8, // 화면 폭의 80%
          color: Colors.indigo[50],
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.3, sigmaY: 1.3), // blur 효과
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: buildTopPanner(context)),
                Expanded(
                  flex: 7,
                  child: buildHelpList(),
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

  Widget buildHelpList() {
    return GetBuilder<HelpController>(
        init: HelpController(),
        builder: (controller) {
          var helps = controller.getHelps();
          return GridView.builder(
            itemCount: helps.length, // 총 목록의 수
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 가로의 아이템 갯수를 3개로 지정
              mainAxisSpacing: 20.0, // 아이템들 사이의 간격
              crossAxisSpacing: 30.0, // 아이템들 사이의 간격
              childAspectRatio: 7.0, // 각 아이템의 높이/너비 비율 (1:1)
            ),
            itemBuilder: (context, index) {
              // 각 목록 아이템 생성
              return buildHelp(helps[index]);
            },
          );
        });
  }

  Widget buildHelp(Help help) {
    return GetBuilder<HelpController>(
      init: HelpController(),
      builder: (controller) {
        bool selected = controller.getSelectedHelpIds().contains(help.id);
        Color color = selected ? Colors.black : Colors.grey;

        return GestureDetector(
          onTap: () {
            controller.updateSelectedHelpId(help.id);
          },
          child: Container(
            width: double.infinity, // 박스의 너비
            padding: const EdgeInsets.symmetric(
                vertical: 8, horizontal: 16), // 내부 패딩
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), // 박스의 모서리 둥글게
              border: Border.all(color: Colors.grey[300]!), // 외곽선
              color: Colors.white, // 내부 배경색
            ),
            child: Row(
              children: [
                Icon(
                  Icons.check,
                  color: color,
                  weight: selected ? 20.0 : 10.0,
                ), // 체크 아이콘
                const SizedBox(width: 10), // 아이콘과 텍스트 사이 간격
                Text(
                  help.title,
                  style: TextStyle(
                      fontSize: 16,
                      color: color,
                      fontWeight:
                          selected ? FontWeight.bold : FontWeight.normal),
                ), // 옵션 텍스트
              ],
            ),
          ),
        );
      },
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
          Container(
            width: 500,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.indigo.shade400,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person_add,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  '호출',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
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
