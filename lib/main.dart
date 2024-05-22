import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:table_order/controller/order_controller.dart';
import 'package:table_order/pages/main_page.dart';
import 'package:table_order/controller/group_controller.dart';

void main() {
  sqfliteFfiInit(); // sqflite_common_ffi를 사용하는 경우 초기화
  databaseFactory = databaseFactoryFfi; // sqflite_common_ffi를 사용하는 경우 초기화
  Get.put(GroupController(), permanent: true);
  Get.put(OrderController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TigerOrder',
      //theme: _buildTheme(),
      home: FutureBuilder(
          future: Future.wait([
            GroupController.to.initState(0, 0),
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const MainPage();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const CircularProgressIndicator(); // 로딩 중을 표시하는 위젯
            }
          }),
    );
  }
}
