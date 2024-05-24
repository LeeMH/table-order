import 'dart:io';

import 'package:flutter/material.dart';

class DialogUtil {
  static void showErrorDialog(String message) {
    // 오류 대화상자 또는 스낵바를 표시하는 코드
    // 예시: SnackBar 사용
    var navigatorKey;
    ScaffoldMessenger.of(navigatorKey.currentContext!)
        .showSnackBar(SnackBar(content: Text(message)));

    // 앱 종료 코드
    // 예시: 5초 후 앱 종료
    Future.delayed(const Duration(seconds: 5), () {
      exit(1); // 앱 종료
    });
  }
}
