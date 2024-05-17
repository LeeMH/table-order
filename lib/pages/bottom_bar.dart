import 'package:flutter/material.dart';
import 'package:table_order/pages/help_page.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Expanded(
            flex: 6,
            child: Center(),
          ),
          Expanded(flex: 2, child: buildHelpButton(context)), // 직원호출 버튼
          Container(
            width: 10,
          ),
          Expanded(flex: 2, child: buildOrderListButton()), // 주문내역 버튼
        ],
      ),
    );
  }

  Widget buildHelpButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            opaque: false, // 배경을 투명하게 설정
            pageBuilder: (BuildContext context, _, __) {
              return HelpPage();
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        height: double.infinity,
        color: Colors.indigo.shade400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person_add, color: Colors.white),
            Container(
              width: 10,
            ),
            const Text("직원호출", style: TextStyle(fontSize: 20, color: Colors.white)),
          ],
        ),
      ),
    );
    // 버튼 클릭 시 수행할 동작을 여기에 작성합니다.
  }

  Widget buildOrderListButton() {
    return GestureDetector(
      onTap: () {
        //
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        height: double.infinity,
        color: Colors.green.shade300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.list_alt_rounded, color: Colors.white),
            Container(
              width: 10,
            ),
            const Text("주문내역", style: TextStyle(fontSize: 20, color: Colors.white)),
          ],
        ),
      ),
    );
    // 버튼 클릭 시 수행할 동작을 여기에 작성합니다.
  }
}
