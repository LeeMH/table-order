import 'package:flutter/material.dart';
import 'package:table_order/pages/menu_group.dart';
import 'package:table_order/pages/menu_list.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Hero(
            tag: 'logo',
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(image: AssetImage('assets/images/logo.png')),
            )),
        title: const Text(
          '호랑이 피자',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Row(
        children: [
          Expanded(flex: 2, child: MenuGroup()),
          Expanded(
            flex: 8,
            child: MenuList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Home 버튼 눌렸을 때의 동작
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Search 버튼 눌렸을 때의 동작
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                // Favorite 버튼 눌렸을 때의 동작
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Settings 버튼 눌렸을 때의 동작
              },
            ),
          ],
        ),
      ),
    );
  }
}
