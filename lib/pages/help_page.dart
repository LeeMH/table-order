import 'dart:ui';

import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // 배경을 투명하게
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height, // 화면 높이의 80%
          width: MediaQuery.of(context).size.width * 0.8, // 화면 폭의 80%
          color: Colors.indigo.shade300,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.3, sigmaY: 1.3), // blur 효과
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '팝업 페이지',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('닫기'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
