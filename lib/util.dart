import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  static String formatNumber(dynamic value) {
    final formatter = NumberFormat('#,###');
    if (value is String) {
      if (value.isNotEmpty) {
        final number = int.parse(value);
        return formatter.format(number);
      } else {
        return "";
      }
    } else if (value is int) {
      return formatter.format(value);
    } else {
      return "";
    }
  }

  static int countSameElements(List<dynamic> list1, List<dynamic> list2) {
    print('list1 => ${list1.map((e) => e.toString()).join(',')}');
    print('list2 => ${list2.map((e) => e.toString()).join(',')}');

    var set1 = list1.toSet();
    var set2 = list2.toSet();

    return set1.intersection(set2).length;
  }

  static void showErrorDialog(String message) {
    // 오류 대화상자 또는 스낵바를 표시하는 코드
    // 예시: SnackBar 사용
    var navigatorKey;
    ScaffoldMessenger.of(navigatorKey.currentContext!)
        .showSnackBar(SnackBar(content: Text(message)));

    // 앱 종료 코드
    // 예시: 5초 후 앱 종료
    Future.delayed(Duration(seconds: 5), () {
      exit(1); // 앱 종료
    });
  }
}
