import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_order/pages/main_page.dart';
import 'package:table_order/services/group_service.dart';
import 'package:table_order/services/menu_service.dart';
import 'package:table_order/services/states/group_state.dart';
import 'package:table_order/services/states/menu_state.dart';

void main() {
  Get.put(GroupState(), permanent: true);
  Get.put(MenuState(), permanent: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GroupService _groupService = GroupService();
  final MenuService _menuService = MenuService();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TigerOrder',
      //theme: _buildTheme(),
      home: FutureBuilder(
          future: Future.wait([
            _groupService.loadGroup(0, 0),
            _menuService.loadGroup(0, 0),
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return MainPage();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return CircularProgressIndicator(); // 로딩 중을 표시하는 위젯
            }
          }),
    );
  }
}
