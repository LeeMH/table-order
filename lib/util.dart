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
}
