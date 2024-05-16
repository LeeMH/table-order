import 'package:table_order/services/models/help.dart';

class HelpRepo {
  Future<List<Help>> fetchHelps(int merchantId, int branchId) async {
    return Future(() {
      return [
        Help(id: 1, title: "물"),
        Help(id: 2, title: "물수건"),
        Help(id: 3, title: "수저,젓가락,포크"),
        Help(id: 4, title: "기본반찬 추가"),
        Help(id: 5, title: "티슈"),
        Help(id: 99, title: "기타"),
      ];
    });
  }
}
