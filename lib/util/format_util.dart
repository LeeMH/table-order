import 'package:intl/intl.dart';

class FormatUtil {
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

  static String formatUnixTimestamp(int unixTimestamp,
      {String timezone = 'Asia/Seoul'}) {
    // 유닉스 타임스탬프를 DateTime 객체로 변환
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(unixTimestamp, isUtc: true);

    // 형식 지정
    final formatter = DateFormat('yyyy-MM-dd HH:mm:ss', 'ko_KR');

    // 형식에 맞게 문자열로 변환
    return formatter.format(dateTime.toLocal());
  }
}
