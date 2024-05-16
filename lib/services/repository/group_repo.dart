import 'package:table_order/services/models/group.dart';

class GroupRepo {
  Future<List<Group>> fetchGroups(int merchantId, int branchId) async {
    return Future(() {
      return [
        Group(id: 1, title: "베스트"),
        Group(id: 2, title: "세트"),
        Group(id: 3, title: "피자"),
        Group(id: 4, title: "샐러드"),
        Group(id: 5, title: "사이드"),
        Group(id: 6, title: "음료"),
      ];
    });
  }
}
