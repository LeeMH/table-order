import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  final int height;
  final Color color;

  const Line({super.key, this.height = 1, this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.toDouble(),
      color: color,
    );
  }
}
