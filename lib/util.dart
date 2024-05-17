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
    var set1 = list1.toSet();
    var set2 = list2.toSet();

    return set1.intersection(set2).length;
  }
}
