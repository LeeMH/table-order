import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_order/pages/help_page.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Center(),
          ),
          Expanded(flex: 2, child: buildHelpButton(context)),
          Container(
            width: 10,
          ),
          Expanded(flex: 2, child: buildOrderListButton()),
          //buildButton("주문내역", Icons.list_alt, Color.fromRGBO(220, 231, 117, 1))
        ],
      ),
    );
  }

  ElevatedButton buildButton(
      String buttonText, IconData buttonIcon, Color buttonColor) {
    return ElevatedButton.icon(
      icon: Icon(buttonIcon, color: Colors.black),
      label: Text(buttonText, style: TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor, // 버튼의 배경색
      ),
      onPressed: () {
        // 버튼 클릭 시 수행할 동작을 여기에 작성합니다.
      },
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
        padding: EdgeInsets.all(5),
        height: double.infinity,
        color: Colors.indigo.shade400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_add, color: Colors.black),
            Container(
              width: 10,
            ),
            Text("직원호출", style: TextStyle(fontSize: 20, color: Colors.black)),
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
        padding: EdgeInsets.all(5),
        height: double.infinity,
        color: Colors.green.shade300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.list_alt_rounded, color: Colors.black),
            Container(
              width: 10,
            ),
            Text("주문내역", style: TextStyle(fontSize: 20, color: Colors.black)),
          ],
        ),
      ),
    );
    // 버튼 클릭 시 수행할 동작을 여기에 작성합니다.
  }
}
